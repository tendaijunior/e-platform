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
					<col width="10%">
					<col width="15%">
					<col width="20%">
					<col width="20%">
					<col width="25%">
					<col width="10%">
				</colgroup>
				<thead>
					<tr class="bg-gradient-primary text-light">
						<th>Course Code</th>
						<th>Date</th>
						<th>Course & Tutor</th>
						<th>Venue</th>
						<th>Class Capacity</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<?php 
						$swhere = "";
						$i = 1;
						$courses = $conn->query("SELECT *,Concat(code,' - ',`name`) as course FROM `train_list` where id in (SELECT train_id FROM `schedule_list` where delete_flag = 0 {$swhere})");
                                $res = $courses->fetch_all(MYSQLI_ASSOC);
                                $train_fcf_arr = array_column($res,'first_class_capacity','id');
                                $train_ef_arr = array_column($res,'economy_capacity','id');
                                $train_arr = array_column($res,'course','id');
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
							<td class="px-0 text-center">
								<?php if($row['type'] == 1): ?>

									<div class="px-1 border-bottom"><span class="text-muted fa fa-calendar-day"></span> <?= date("M d, Y",strtotime($row['date_schedule'])) ?></div>
								
								<?php else: ?>
									<div class="px-1 border-bottom"><span class="text-muted fa fa-calendar-day"></span> <?= date("M d, Y",strtotime($row['date_schedule'])) ?></div>
									<!-- <div class="px-1 border-bottom"><?php echo date("y-m-d",strtotime($row['date_schedule'])) ?></div> -->
								<?php endif; ?>
								<div class="px-1"><span class="text-muted fa fa-clock"></span> <?= date("h:i A",strtotime($row['time_schedule'])) ?></div>
							</td>
							<td class="px-0"><?php echo isset($train_arr[$row['train_id']]) ? $train_arr[$row['train_id']] : "N/A" ?></td>
							<td class="PX-0"><b><?php echo $row['venue'] ?></b></td>
							<td class="px-0">
								<div class="px-2 py-1 border-bottom d-flex justify-content-between align-items-center">
									<div class="d-flex align-items-center text-muted">
										<span>Premium: </span>
										<span class="fa fa-user mx-1"></span>
										<b><?= isset($train_fcf_arr[$row['train_id']]) ? $train_fcf_arr[$row['train_id']] : 0 ?></b>
									</div>
									<div class="text-end text-muted">
										<span class="fa fa-tag me-1"></span>
										<b>R<?= rtrim(number_format($row['first_class_fare'], 2), '.') ?></b>
									</div>
								</div>
								<div class="px-2 py-1 d-flex justify-content-between align-items-center">
									<div class="d-flex align-items-center text-muted">
										<span>Standard: </span>
										<span class="fa fa-user mx-1"></span>
										<b><?= isset($train_ef_arr[$row['train_id']]) ? $train_ef_arr[$row['train_id']] : 0 ?></b>
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
			uni_modal("Add New Course","courses/manage_train.php")
		})
        $('.edit_data').click(function(){
			uni_modal("Update Course Details","courses/manage_train.php?id="+$(this).attr('data-id'))
		})
		$('.delete_data').click(function(){
			_conf("Are you sure to delete this Course permanently?","delete_train",[$(this).attr('data-id')])
		})
		$('.view_data').click(function(){
			uni_modal("Course Details","courses/view_train.php?id="+$(this).attr('data-id'))
		})
		$('.table td, .table th').addClass('py-1 px-2 align-middle')
		$('.table').dataTable({
            columnDefs: [
                { orderable: false, targets: 5 }
            ],
        });
	})
</script>