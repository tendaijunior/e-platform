<?php include('db_connect.php');?>
<div class="container-fluid">
	
	<div class="col-lg-12">
		<div class="row mb-4 mt-4">
			<div class="col-md-12">
				
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<div class="card">
					<div class="card-header">
						<b>Schedule</b>
						<span class="float:right"><button class="btn btn-primary btn-block btn-sm col-sm-2 float-right"  id="new_schedule">
					<i class="fa fa-plus"></i> New Entry
				</button></span>
					</div>
					<div class="card-body">
						<div class="row">
						</div>
						<hr>
						<div id="calendar"></div>
					</div>
				</div>
			</div>
			<!-- Table Panel -->
		</div>
	</div>	

</div>
<style>
	
	td{
		vertical-align: middle !important;
	}
	td p{
		margin: unset
	}
	img{
		max-width:100px;
		max-height: :150px;
	}
	.avatar {
	    display: flex;
	    border-radius: 100%;
	    width: 100px;
	    height: 100px;
	    align-items: center;
	    justify-content: center;
	    border: 3px solid;
	    padding: 5px;
	}
	.avatar img {
	    max-width: calc(100%);
	    max-height: calc(100%);
	    border-radius: 100%;
	}
		input[type=checkbox]
{
  /* Double-sized Checkboxes */
  -ms-transform: scale(1.5); /* IE */
  -moz-transform: scale(1.5); /* FF */
  -webkit-transform: scale(1.5); /* Safari and Chrome */
  -o-transform: scale(1.5); /* Opera */
  transform: scale(1.5);
  padding: 10px;
}
a.fc-daygrid-event.fc-daygrid-dot-event.fc-event.fc-event-start.fc-event-end.fc-event-past {
    cursor: pointer;
}
a.fc-timegrid-event.fc-v-event.fc-event.fc-event-start.fc-event-end.fc-event-past {
    cursor: pointer;
}
</style>
<script>
	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');
		var calendar;

		// Call AJAX directly on page load using predefined faculty_id
		start_load();
		$.ajax({
			url: 'ajax.php?action=get_schecdule',
			method: 'POST',
			data: {
				faculty_id: '<?php echo $_SESSION["login_id"] ?>' // Replace with actual session variable
			},
			success: function(resp) {
				let events = [];
				if (resp) {
					resp = JSON.parse(resp);
					if (resp.length > 0) {
						Object.keys(resp).forEach(function(k) {
							let obj = {
								title: resp[k].course_name,
								data_id: resp[k].id,
								data_location: resp[k].location,
								data_description: resp[k].description
							};
							if (resp[k].is_repeating == 1) {
								obj.daysOfWeek = resp[k].dow;
								obj.startRecur = resp[k].start;
								obj.endRecur = resp[k].end;
								obj.startTime = resp[k].time_from;
								obj.endTime = resp[k].time_to;
							} else {
								obj.start = resp[k].schedule_date + 'T' + resp[k].time_from;
								obj.end = resp[k].schedule_date + 'T' + resp[k].time_to;
							}
							events.push(obj);
						});
					}
				}

				// Render calendar
				calendar = new FullCalendar.Calendar(calendarEl, {
					headerToolbar: {
						left: 'prev,next today',
						center: 'title',
						right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
					},
					initialDate: '<?php echo date("Y-m-d") ?>',
					weekNumbers: true,
					navLinks: true,
					editable: false,
					selectable: true,
					nowIndicator: true,
					dayMaxEvents: true,
					events: events,
					eventClick: function(e) {
						const data = e.event.extendedProps;
						uni_modal('View Schedule Details', 'view_schedule.php?id=' + data.data_id, 'mid-large');
					}
				});

				calendar.render();
			},
			complete: function() {
				end_load();
			}
		});

		// Create new schedule
		$('#new_schedule').click(function() {
			uni_modal('New Schedule', 'manage_schedule.php', 'mid-large');
		});
	});
</script>
