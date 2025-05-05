<?php include 'admin/db_connect.php' ?>
<?php
if(isset($_GET['id'])){
	$qry = $conn->query("SELECT * FROM vcourseschedule where id=".$_GET['id'])->fetch_array();
	foreach($qry as $k =>$v){
		$$k = $v;
	}
}
?>
<head>
  <style>
    .grid-container {
      display: grid;
      grid-template-columns: 1fr 1fr;
      gap: 10px; /* optional space between columns */
    }
    .grid-item {
      padding: 10px;
      border: 1px solid #ccc; /* optional */
    }
  </style>
</head>
<div class="container-fluid">
	<p>Course Title: <b><?php echo ucwords($train_name) ?></b></p>
	<p>Course Tutor: <b><?php echo ucwords($tutor_name) ?></b></p>
	<p>Course Description: <br/> <?php echo $description ?></p>
	<p>Location: <br/></i> <b><?php echo $region_location ?></b></p>
	<p>Date: <b><?php echo date('F j, Y', strtotime($schedule_date)); ?></b></p>
	<div class="grid-container">
		<div class="item">
			<p>Starting Time: </i> <b><?php echo date('h:i A',strtotime("2020-01-01 ".$schedule_date)) ?></b></p>
		</div>
		<div class="item">
			<p>Premium Class:</i> <b>R<?php echo $premium_class_fare ?>.00</b></p>
		</div>
	</div>
	<div class="grid-container">
		<div class="item">
			<p>Ending Time: </i> <b><?php echo date('h:i A',strtotime("2020-01-01 ".$schedule_date)) ?></b></p>
		</div>
		<div class="item">
			<p>Standard Class: </i> <b>R<?php echo $standard_class_fare ?>0.00</b></p>
		</div>
	</div>
	<hr class="divider">
</div>
<div class="modal-footer display">
	<div class="row">
		<div class="col-md-12">
			<a href="?page=reserve&sid=<?= $id ?>" class="book-now-btn">Book Now</a>
			<button class="btn float-right btn-secondary" type="button" data-dismiss="modal">Close</button>
		</div>
	</div>
</div>
<style>
	p{
		margin:unset;
	}
	#uni_modal .modal-footer{
		display: none;
	}
	#uni_modal .modal-footer.display {
		display: block;
	}
</style>
<script>
	$('#edit').click(function(){
		uni_modal('Edit Schedule','manage_schedule.php?id=<?php echo $id ?>','mid-large')
	})
	$('#delete_schedule').click(function(){
		_conf("Are you sure to delete this schedule?","delete_schedule",[$(this).attr('data-id')])
	})
	
	function delete_schedule($id){
		start_load()
		$.ajax({
			url:'ajax.php?action=delete_schedule',
			method:'POST',
			data:{id:$id},
			success:function(resp){
				if(resp==1){
					alert_toast("Data successfully deleted",'success')
					setTimeout(function(){
						location.reload()
					},1500)

				}
			}
		})
	}
</script>