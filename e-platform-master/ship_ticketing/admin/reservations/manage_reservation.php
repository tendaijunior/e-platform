<?php
if(isset($_GET['id']) && $_GET['id'] > 0){
    $qry = $conn->query("SELECT * from `reservations` where id = '{$_GET['id']}' ");
    if($qry->num_rows > 0){
        foreach($qry->fetch_assoc() as $k => $v){
            $$k=$v;
        }
    }
}
?>
<style>
    span.select2-selection.select2-selection--single {
        border-radius: 0;
        padding: 0.25rem 0.5rem;
        padding-top: 0.25rem;
        padding-right: 0.5rem;
        padding-bottom: 0.25rem;
        padding-left: 0.5rem;
        height: auto;
    }
</style>
<div class="card card-outline card-info">
	<div class="card-header">
		<h3 class="card-title"><?php echo isset($id) ? "Update ": "Create New " ?> Reservation</h3>
	</div>
	<div class="card-body">
		<form action="" id="reservation-form">
			<input type="hidden" name ="id" value="<?php echo isset($id) ? $id : '' ?>">
			<?php if(!isset($status)): ?>
			<input type="hidden" name ="status" value="<?php echo isset($status) ? $status : 1 ?>">
			<?php endif; ?>

			<div class="form-group row">
            <div class="col-md-6">
                <label for="schedule_id">Schedule</label>
                <select name="schedule_id" id="schedule_id" class="custom-select custom-select-sm rounded-0 select2">
						<option value="" disabled <?php echo !isset($schedule_id) ? "selected" :'' ?>></option>
						<?php 
							$port = $conn->query("SELECT id, concat(`name`,'[',`location`,']') as `route` FROM port_list");
							$routes = array_column($port->fetch_all(MYSQLI_ASSOC),'route','id');
							$vessel = $conn->query("SELECT id, concat(`id_code`,' - ',`name`) as `vessel` FROM `ship_list` ");
							$vessels = array_column($vessel->fetch_all(MYSQLI_ASSOC),'vessel','id');
							$sched_qry = $conn->query("SELECT * FROM `schedules` where date(departure_datetime) > '".date('Y-m-d')."' order by unix_timestamp(departure_datetime) asc ");
							while($row = $sched_qry->fetch_assoc()):
						?>
						<option value="<?php echo $row['id'] ?>" <?php echo isset($schedule_id) && $schedule_id == $row['id'] ? 'selected' : '' ?>>
						<div><?php echo date("M d,Y h:i A",strtotime($row['departure_datetime'])) ?></div>
						<div>[Route: <?php echo $routes[$row['port_from_id']] . ' - ' .$routes[$row['port_to_id']] ?>]</div>
						<div>[Vessel: <?php echo $vessels[$row['ship_id']] ?>]</div>
					</option>
						<?php endwhile; ?>
					</select>
				</div>
			</div>
			<div class="form-group col-md-8" id="accom-field">
			</div>
			<h4>Passenger/s Details</h4>
			<hr class="border-light">
			<div class="row mb-2 border-bottom p-item">
				<div class="col-md-6">
					<div class="form-group">
						<label for="" class="control-laberl">Name</label>
						<input type="text" class="form-control form-control-sm rounded-0" name="name[]" value="<?php echo isset($name) ? $name : '' ?>" required>
					</div>
					<div class="form-group">
						<label for="" class="control-laberl">Gender</label>
						<select name="gender[]" id="gender" class="form-control form-control-sm" required>
							<option <?php echo isset($gender) && $gender == "Male" ? 'selected' : '' ?>>Male</option>
							<option <?php echo isset($gender) && $gender == "Female" ? 'selected' : '' ?>>Female</option>
						</select>
					</div>
					<div class="form-group">
						<label for="" class="control-laberl">Date of Birth</label>
						<input type="date" class="form-control form-control-sm rounded-0" name="dob[]" value="<?php echo isset($dob) ? date("Y-m-d",strtotime($dob)) : '' ?>" required>
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label for="" class="control-laberl">Contact #</label>
						<input type="text" class="form-control form-control-sm rounded-0" name="contact[]" value="<?php echo isset($contact) ? $contact : '' ?>" required>
					</div>
					<div class="form-group">
						<label for="" class="control-laberl">Address</label>
						<textarea rows="3" class="form-control form-control-sm rounded-0" name="address[]" value="" required><?php echo isset($address) ? $address : '' ?></textarea>
					</div>
					<div class="form-group row justify-content-center">
						<button class="btn btn-danger btn-sm btn-flat rem_item" type="button" onclick="rem_item($(this))"><i class="fa fa-trash"></i> Remove</button>
					</div>
				</div>
			</div>
			<div class="w-100 d-flex justify-content-center py-1">
				<button class="btn btn-primary btn-sm btn-flat" type="button" id="add_passenger">Add Passenger</button>
			</div>
			<?php if(isset($status)): ?>
				<div class="form-group col-md-6">
					<label for="" class="control-laberl">Status</label>
					<select name="status" id="status" class="form-control form-control-sm" required>
						<option value="0" <?php echo isset($status) && $status == 0 ? 'selected' : '' ?>>Pending</option>
						<option value="1" <?php echo isset($status) && $status == 1 ? 'selected' : '' ?>>Confirmed</option>
						<option value="2" <?php echo isset($status) && $status == 2 ? 'selected' : '' ?>>Cancelled</option>
					</select>
				</div>
			<?php endif; ?>
		</form>
	</div>
	<div class="card-footer">
		<button class="btn btn-flat btn-primary" form="reservation-form">Save</button>
		<a class="btn btn-flat btn-default" href="?page=reservations">Cancel</a>
	</div>
</div>
<script>
    function displayImg(input,_this) {
        console.log(input.files)
        var fnames = []
        Object.keys(input.files).map(k=>{
            fnames.push(input.files[k].name)
        })
        _this.siblings('.custom-file-label').html(JSON.stringify(fnames))
	    
	}
	function rem_item(_this){
		if($('.p-item').length > 1){
			_this.closest('.p-item').remove()
		}else{
			alert_toast("Reservation must have atleast 1 Passenger Listed.","warning")
		}
	}
	$('#add_passenger').click(function(){
		var item = $('.p-item').first().clone()
			item.find('input,select,textarea').val('')
			$('.p-item').last().after(item)
	})
	function load_accom(_this){
		start_loader()
			$.ajax({
				url:'./reservations/accommodation_select.php?id='+_this.val(),
				error:function(err){
					console.log(err)
					alert_toast(" An error occured while fetching the data.", 'error')
					end_loader()
				},
				success:function(resp){
					if(resp){
						$('#accom-field').html(resp)
						if('<?php echo isset($accommodation_id) ?>' != ''){
							$('input[name="accommodation_id"][value="<?php echo isset($accommodation_id) ? $accommodation_id : "" ?>"]').attr('checked',true)
						}
					}else{
						console.log(resp)
						alert_toast(" An error occured while fetching the data.", 'error')
					}
					end_loader()
				}
			})
	}
	$(document).ready(function(){
		$('#schedule_id').change(function(){
			load_accom($(this))
		})
		if('<?php echo isset($schedule_id) ?>' != ''){
			load_accom($('#schedule_id'))
			$('#add_passenger,.rem_item').hide()
		}
			
        $('.select2').select2({placeholder:"Please Select here",width:"relative"})
		$('#reservation-form').submit(function(e){
			e.preventDefault();
            var _this = $(this)
			 $('.err-msg').remove();
			 if($('#schedule_id').val() <= 0){
				alert_toast(" Schedule is required.",'warning')
				$('#schedule_id').focus()
				return false;
			}
			start_loader();
			$.ajax({
				url:_base_url_+"classes/Master.php?f=save_reservation",
				data: new FormData($(this)[0]),
                cache: false,
                contentType: false,
                processData: false,
                method: 'POST',
                type: 'POST',
                dataType: 'json',
				error:err=>{
					console.log(err)
					alert_toast("An error occured",'error');
					end_loader();
				},
				success:function(resp){
					if(typeof resp =='object' && resp.status == 'success'){
						location.href = "./?page=reservations";
					}else if(resp.status == 'failed' && !!resp.msg){
                        var el = $('<div>')
                            el.addClass("alert alert-danger err-msg").text(resp.msg)
                            _this.prepend(el)
                            el.show('slow')
                            $("html, body").animate({ scrollTop: _this.closest('.card').offset().top }, "fast");
                            end_loader()
                    }else{
						alert_toast("An error occured",'error');
						end_loader();
                        console.log(resp)
					}
				}
			})
		})

        
	})
</script>