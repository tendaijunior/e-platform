<style>
    .img-thumb-path{
        width:100px;
        height:80px;
        object-fit:scale-down;
        object-position:center center;
    }
</style>
<div class="card card-outline card-primary rounded-0 shadow">
	<div class="card-header">
		<h3 class="card-title">List of Courses</h3>
	</div>
	<div class="card-body">
		<div class="container-fluid">
        <div class="container-fluid">
			<table class="table table-bordered table-hover table-striped">
				<colgroup>
					<col width="15%">
					<col width="15%">
					<col width="15%">
					<col width="15%">
					<col width="30%">
					<col width="10%">
				</colgroup>
				<thead>
					<tr class="bg-gradient-primary text-light">
						<th>Course Code #</th>
						<th>Date Created</th>
						<th>Train #</th>
						<th>Name</th>
						<th>Capacity</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<?php 
						$swhere = "";
						$i = 1;
						$trains = $conn->query("SELECT *,Concat(code,' - ',`name`) as train FROM `train_list` where id in (SELECT train_id FROM `schedule_list` where delete_flag = 0 {$swhere})");
                                $res = $trains->fetch_all(MYSQLI_ASSOC);
                                $train_fcf_arr = array_column($res,'first_class_capacity','id');
                                $train_ef_arr = array_column($res,'economy_capacity','id');
                                $train_arr = array_column($res,'train','id');
                                $qry = $conn->query("SELECT * from `schedule_list` where delete_flag = 0 {$swhere} order by unix_timestamp(`date_created`) asc ");
                                while($row = $qry->fetch_assoc()):
                                    $fc_capacity = isset($train_fcf_arr[$row['train_id']]) ? $train_fcf_arr[$row['train_id']] : 0;
                                    $e_capacity = isset($train_ef_arr[$row['train_id']]) ? $train_ef_arr[$row['train_id']] : 0;
                                    $fc_reserve = isset($reserve[$row['id']][1]) ? $reserve[$row['id']][1] : 0;
                                    $e_reserve = isset($reserve[$row['id']][2]) ? $reserve[$row['id']][2] : 0;
                                    $fc_slot = $fc_capacity - $fc_reserve;
                                    $e_slot = $e_capacity - $e_reserve;
						
					?>
						<tr>
							<td class="text-center"><?php echo $row['code'] ?></td>
							<td class=""><?php echo date("Y-m-d H:i",strtotime($row['date_created'])) ?></td>
							<td class="px-1"><?php echo isset($train_arr[$row['train_id']]) ? $train_arr[$row['train_id']] : "N/A" ?></td>
							<td class=""><p class="m-0 truncate-1"><?php echo $row['route_from'] ?></p></td>
							<td class="px-0">
    <div class="px-2 py-1 border-bottom d-flex justify-content-between align-items-center">
        <div class="d-flex align-items-center text-muted">
            <span>First Class</span>
            <span class="fa fa-user mx-1"></span>
            <?= $row['type'] == 1 ? "<i class='fa fa-question' title='Slot depends on the date you desire.'></i>" : "" ?>
        </div>
        <div class="text-end text-muted">
            <span class="fa fa-tag me-1"></span>
            <b>R<?= rtrim(number_format($row['first_class_fare'], 2), '.') ?></b>
        </div>
    </div>
    <div class="px-2 py-1 d-flex justify-content-between align-items-center">
        <div class="d-flex align-items-center text-muted">
            <span>Economy</span>
            <span class="fa fa-user mx-1"></span>
            <?= $row['type'] == 1 ? "<i class='fa fa-question' title='Slot depends on the date you desire.'></i>" : "" ?>
        </div>
        <div class="text-end text-muted">
            <span class="fa fa-tag me-1"></span>
            <b>R<?= rtrim(number_format($row['economy_fare'], 2), '.') ?></b>
        </div>
    </div>
</td>
							<td class="px-1" align="center">
                                        <a href="./?page=reserve&sid=<?= $row['id'] ?>" class="btn btn-flat btn-primary btn-sm" >Book <i class="fa fa-angle-right"></i></a>
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
        $('#create_new').click(function(){
			uni_modal("Add New Train","trains/manage_train.php")
		})
        $('.edit_data').click(function(){
			uni_modal("Update Train Details","trains/manage_train.php?id="+$(this).attr('data-id'))
		})
		$('.delete_data').click(function(){
			_conf("Are you sure to delete this Train permanently?","delete_train",[$(this).attr('data-id')])
		})
		$('.view_data').click(function(){
			uni_modal("Train Details","trains/view_train.php?id="+$(this).attr('data-id'))
		})
		$('.table td, .table th').addClass('py-1 px-2 align-middle')
		$('.table').dataTable({
            columnDefs: [
                { orderable: false, targets: 5 }
            ],
        });
	})
	function delete_train($id){
		start_loader();
		$.ajax({
			url:_base_url_+"classes/Master.php?f=delete_train",
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