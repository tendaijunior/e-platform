<?php if($_settings->chk_flashdata('success')): ?>
<script>
	alert_toast("<?php echo $_settings->flashdata('success') ?>",'success')
</script>
<?php endif;?>
<div class="card card-outline card-primary">
	<div class="card-header">
		<h3 class="card-title">List of Schedule</h3>
		<div class="card-tools">
			<a href="?page=schedule/manage_schedule" class="btn btn-flat btn-primary"><span class="fas fa-plus"></span>  Add New</a>
		</div>
	</div>
	<div class="card-body">
		<div class="container-fluid">
        <div class="container-fluid">
			<table class="table table-bordered table-stripped">
				<colgroup>
					<col width="5%">
					<col width="20%">
					<col width="25%">
					<col width="25%">
					<col width="15%">
					<col width="10%">
				</colgroup>
				<thead>
					<tr>
						<th>#</th>
						<th>Schedule</th>
						<th>Vessel</th>
						<th>Route</th>
						<th>Passengers</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<?php 
					$i = 1;
					$port = $conn->query("SELECT id, concat(`name`,'[',`location`,']') as `route` FROM port_list");
					$routes = array_column($port->fetch_all(MYSQLI_ASSOC),'route','id');
					$vessel = $conn->query("SELECT id, concat(`id_code`,' - ',`name`) as `vessel` FROM `ship_list` ");
					$vessels = array_column($vessel->fetch_all(MYSQLI_ASSOC),'vessel','id');
					$qry = $conn->query("SELECT * from `schedules` order by unix_timestamp(departure_datetime) asc,unix_timestamp(arrival_datetime) asc ");
					while($row = $qry->fetch_assoc()):
							$max = $conn->query("SELECT SUM(max_passenger) as total FROM `sched_accom` where `schedule_id` = '{$row['id']}' ")->fetch_array()['total'];
							$booked = $conn->query("SELECT * FROM `reservations` where `status` = 1 and schedule_id = '{$row['id']}'")->num_rows;
					?>
						<tr>
							<td class="text-center"><?php echo $i++; ?></td>
							<td>
								<small><b>Departure:</b> <?php echo date("M d,Y h:i A",strtotime($row['departure_datetime'])) ?></small><br>
								<small><b>Arrival:</b> <?php echo date("M d,Y h:i A",strtotime($row['arrival_datetime'])) ?></small>
							</td>
							<td><?php echo $vessels[$row['ship_id']] ?></td>
							<td>
								<small><b>From:</b> <?php echo $routes[$row['port_from_id']] ?></small><br>
								<small><b>To:</b> <?php echo $routes[$row['port_to_id']] ?></small>
							</td>
							<td>
								<small><b>Max:</b> <?php echo $max ?></small><br>
								<small><b>Booked:</b> <?php echo $booked ?></small>
							</td>
							<td align="center">
								 <button type="button" class="btn btn-flat btn-default btn-sm dropdown-toggle dropdown-icon" data-toggle="dropdown">
				                  		Action
				                    <span class="sr-only">Toggle Dropdown</span>
				                  </button>
				                  <div class="dropdown-menu" role="menu">
				                    <a class="dropdown-item" href="?page=schedule/manage_schedule&id=<?php echo $row['id'] ?>"><span class="fa fa-edit text-primary"></span> Edit</a>
				                    <div class="dropdown-divider"></div>
				                    <a class="dropdown-item delete_data" href="javascript:void(0)" data-id="<?php echo $row['id'] ?>"><span class="fa fa-trash text-danger"></span> Delete</a>
				                  </div>
							</td>
						</tr>
					<?php endwhile; ?>
				</tbody>
			</table>
		</div>
		</div>
	</div>
</div>
<script>
	$(document).ready(function(){
		$('.delete_data').click(function(){
			_conf("Are you sure to delete this product permanently?","delete_product",[$(this).attr('data-id')])
		})
		$('.table').dataTable();
	})
	function delete_product($id){
		start_loader();
		$.ajax({
			url:_base_url_+"classes/Master.php?f=delete_product",
			method:"POST",
			data:{id: $id},
			dataType:"json",
			error:err=>{
				console.log(err)
				alert_toast("An error occured.",'error');
				end_loader();
			},
			success:function(resp){
				if(typeof resp== 'object' && resp.status == 'success'){
					location.reload();
				}else{
					alert_toast("An error occured.",'error');
					end_loader();
				}
			}
		})
	}
</script>