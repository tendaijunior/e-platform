<?php
if(isset($_GET['id']) && $_GET['id'] > 0){
    $qry = $conn->query("SELECT * from `schedules` where id = '{$_GET['id']}' ");
    if($qry->num_rows > 0){
        foreach($qry->fetch_assoc() as $k => $v){
            $$k=stripslashes($v);
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
		<h3 class="card-title"><?php echo isset($id) ? "Update ": "Add New " ?> Schedul</h3>
	</div>
	<div class="card-body">
		<form action="" id="schedule-form">
			<input type="hidden" name ="id" value="<?php echo isset($id) ? $id : '' ?>">
        <div class="form-group row">
            <div class="col-md-6">
                <label for="departure_datetime">Departure Date/Time</label>
                <input type="datetime-local" name="departure_datetime" id ="departure_datetime" class="form-control form-control-sm rounded-0" value="<?php echo isset($departure_datetime) ? date("Y-m-d\\TH:i",strtotime($departure_datetime)) : "" ?>" required>
            </div>
            <div class="col-md-6">
                <label for="arrival_datetime">arrival Date/Time</label>
                <input type="datetime-local" name="arrival_datetime" id ="arrival_datetime" class="form-control form-control-sm rounded-0" value="<?php echo isset($arrival_datetime) ? date("Y-m-d\\TH:i",strtotime($arrival_datetime)) : "" ?>" required>
            </div>
        </div>
        <div class="form-group row">
            <div class="col-md-6">
                <label for="ship_id">Vessel</label>
                <select name="ship_id" id="ship_id" class="custom-select custom-select-sm rounded-0 select2">
                    <option value="" disabled <?php echo !isset($ship_id) ? "selected" :'' ?>></option>
                    <?php 
                        $ship_qry = $conn->query("SELECT * FROM ship_list where `status` = 1 order by `name` asc ");
                        while($row = $ship_qry->fetch_assoc()):
                    ?>
                    <option value="<?php echo $row['id'] ?>" <?php echo isset($ship_id) && $ship_id == $row['id'] ? 'selected' : '' ?>><?php echo $row['id_code'] . ' - ' . $row['name'] ?></option>
                    <?php endwhile; ?>
                </select>
            </div>
        </div>
        <div class="form-group row">
        <?php $port_qry = $conn->query("SELECT * FROM port_list order by `name` asc "); ?>
            <div class="col-md-6">
                    <label for="port_from_id">From</label>
                    <select name="port_from_id" id="port_from_id" class="custom-select custom-select-sm rounded-0 select2">
                        <option value="" disabled <?php echo !isset($port_from_id) ? "selected" :'' ?>></option>
                        <?php 
                            while($row = $port_qry->fetch_assoc()):
                        ?>
                        <option value="<?php echo $row['id'] ?>" <?php echo isset($port_from_id) && $port_from_id == $row['id'] ? 'selected' : '' ?>><?php echo $row['name']."[".$row['location']."]" ?></option>
                        <?php endwhile; ?>
                    </select>
            </div>
        <?php $port_qry = $conn->query("SELECT * FROM port_list order by `name` asc "); ?>
            <div class="col-md-6">
                <label for="port_to_id">Destination</label>
                <select name="port_to_id" id="port_to_id" class="custom-select custom-select-sm rounded-0 select2">
                    <option value="" disabled <?php echo !isset($port_to_id) ? "selected" :'' ?>></option>
                    <?php 
                        while($row = $port_qry->fetch_assoc()):
                    ?>
                    <option value="<?php echo $row['id'] ?>" <?php echo isset($port_to_id) && $port_to_id == $row['id'] ? 'selected' : '' ?>><?php echo $row['name']."[".$row['location']."]" ?></option>
                    <?php endwhile; ?>
                </select>
            </div>
        </div>
        <hr>
        <div class="row mb-2">
            <div class="col-md-2"><label for="accommodation">Accommodation</label></div>
            <div class="col-md-4">
                <select id="accomodation_id" class="custom-select custom-select-sm rounded-0 select2">
                    <option value="" disabled selected ></option>
                    <?php 
                        $accom_qry = $conn->query("SELECT * FROM `accommodations` order by `accommodation` asc ");
                        while($row = $accom_qry->fetch_assoc()):
                    ?>
                    <option value="<?php echo $row['id'] ?>"><?php echo $row['accommodation'] ?></option>
                    <?php endwhile; ?>
                </select>
            </div>
            <div class="col-md-4"><button class="btn btn-primary btn-flat btn-sm" type="button" id="add_to_list">Add to List</button></div>
        </div>
        <div class="form-group">
            <table class="table table-bordered border-hovered border-stripped" id="accom_list">
                <colgroup>
                    <col width="60%">
                    <col width="15%">
                    <col width="15%">
                    <col width="10%">
                </colgroup>
                <thead>
                    <tr>
                        <th class="py-1 px-2 text-center">Accomodation</th>
                        <th class="py-1 px-2 text-center">Net Fare</th>
                        <th class="py-1 px-2 text-center">Max Passenger</th>
                        <th class="py-1 px-2 text-center">Action</th>
                    </tr>
                </thead>

                <tbody>
                    <?php 
                    if(isset($id)):
                    $accom_qry = $conn->query("SELECT sa.*,a.accommodation FROM sched_accom sa inner join `accommodations` a on sa.accommodation_id = a.id where sa.schedule_id = '{$id}' order by `id` asc");
                        while($row = $accom_qry->fetch_assoc()):
                    ?>
                    <tr data-aid ="<?php echo $row['accommodation_id'] ?>">
                    <td class="py-1 px-2"><?php echo $row['accommodation'] ?><input type="hidden" name="accommodation_id[]" value="<?php echo $row['accommodation_id'] ?>"/><input type="hidden" name="net_fare[]" value="<?php echo $row['net_fare'] ?>"/><input type="hidden" name="max_passenger[]" value="<?php echo $row['max_passenger'] ?>"/></td>
                    <td class="py-1 px-2 number text-right" contenteditable data-name="net_fare"><?php echo $row['net_fare'] ?></td>
                    <td class="py-1 px-2 number text-right" contenteditable data-name="max_passenger"><?php echo $row['max_passenger'] ?></td>
                    <td class="py-1 px-2 text-center"><button class="btn btn-sm btn-flat btn-danger py-1 px-1" type="button" onclick="rem_item($(this))"><i class="fa fa-times"></i></button></td>
                    </tr>
                    <?php endwhile; ?>
                    <?php endif; ?>
                </tbody>
            </table>
        </div>

			
		</form>
	</div>
	<div class="card-footer">
		<button class="btn btn-flat btn-primary" form="schedule-form">Save</button>
		<a class="btn btn-flat btn-default" href="?page=product">Cancel</a>
	</div>
</div>
<script>
    function data_func(){
        $('.number').each(function(){
            $(this).on('keyup input keypress',function(e){
                var num = $(this).text()
                    last = e.originalEvent.key
                    dec_count = (num.match(/\./g) || []).length;
                if($.isNumeric(last) == true || (last == '.' && dec_count <= 0)){
                    e.returnValue = true;
                    var inputName = $(this).attr('data-name')
                     $(this).closest('tr').find('input[name="'+inputName+'[]"]').val($(this).text())
                }else{
                e.preventDefault()
                }
                
            })
        })
    }
    function rem_item(_this){
        _this.closest('tr').remove()
    }
	$(document).ready(function(){
        $('.rem_img').click(function(){
            _conf("Are sure to delete this image permanently?",'delete_img',["'"+$(this).attr('data-path')+"'"])
        })
        $('.select2').select2({placeholder:"Please Select here",width:"relative"})
        $('#add_to_list').click(function(){
            var accom_id = $("#accomodation_id").val()
            if(accom_id <= 0)
                return false;
            if($('#accom_list tr[data-aid="'+accom_id+'"]').length > 0){
                alert_toast("Accommodation is already on the list.","warning")
                return false;
            }
            var accom_name = $("#accomodation_id option[value='"+accom_id+"']").text()
            var tr = $("<tr data-aid = '"+accom_id+"'>")
                tr.append('<td class="py-1 px-2">'+accom_name+'<input type="hidden" name="accommodation_id[]" value="'+accom_id+'"/><input type="hidden" name="net_fare[]" value="0"/><input type="hidden" name="max_passenger[]" value="0"/></td>')
                tr.append('<td class="py-1 px-2 number text-right" contenteditable data-name="net_fare">0</td>')
                tr.append('<td class="py-1 px-2 number text-right" contenteditable data-name="max_passenger">0</td>')
                tr.append('<td class="py-1 px-2 text-center"><button class="btn btn-sm btn-flat btn-danger py-1 px-1" type="button" onclick="rem_item($(this))"><i class="fa fa-times"></i></button></td>')
            $('#accom_list tbody').append(tr)
            $("#accomodation_id").val('').trigger('change')
            data_func();
        })
		$('#schedule-form').submit(function(e){
			e.preventDefault();
            var _this = $(this)
			 $('.err-msg').remove();
             if($('#departure_datetime').val() == $('#arrival_datetime').val()){
                 alert_toast(" Departure and Arrival Date/Time is invalid.",'error')
                 return false;
             }
             if($('#port_from_id').val() == $('#port_to_id').val()){
                 alert_toast(" Port From and Destination is invalid.",'error')
                 return false;
             }
             if($('#accom_list tbody tr').length <= 0){
                alert_toast(" Accommodation List must contain alteast 1 item.",'warning')
                 return false;
             }
			start_loader();
			$.ajax({
				url:_base_url_+"classes/Master.php?f=save_schedule",
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
						location.href = "./?page=schedule";
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

        $('.summernote').summernote({
		        height: 200,
		        toolbar: [
		            [ 'style', [ 'style' ] ],
		            [ 'font', [ 'bold', 'italic', 'underline', 'strikethrough', 'superscript', 'subscript', 'clear'] ],
		            [ 'fontname', [ 'fontname' ] ],
		            [ 'fontsize', [ 'fontsize' ] ],
		            [ 'color', [ 'color' ] ],
		            [ 'para', [ 'ol', 'ul', 'paragraph', 'height' ] ],
		            [ 'table', [ 'table' ] ],
		            [ 'view', [ 'undo', 'redo', 'fullscreen', 'codeview', 'help' ] ]
		        ]
		    })
	})
</script>