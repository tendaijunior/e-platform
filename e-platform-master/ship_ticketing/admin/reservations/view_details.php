<?php 
if(!isset($conn))
require_once('../../config.php');
?>
<?php 
 $qry = $conn->query("SELECT * from `reservations` where id = '{$_GET['id']}' ");
 if($qry->num_rows > 0){
     foreach($qry->fetch_assoc() as $k => $v){
         $$k=$v;
     }
 }

 $sched_qry = $conn->query("SELECT * FROM `schedules` where id = '{$schedule_id}' ");
 if($sched_qry->num_rows > 0){
    foreach($sched_qry->fetch_array() as $k => $v){
        $sched[$k]=$v;
    }
 }
 $port_from = $conn->query("SELECT concat(`name`,' [',`location`,']') as `port_from` FROM `port_list` where id = '{$sched['port_from_id']}' ")->fetch_array()['port_from'];
 $port_to = $conn->query("SELECT concat(`name`,' [',`location`,']') as `port_to` FROM `port_list` where id = '{$sched['port_to_id']}' ")->fetch_array()['port_to'];
 $vessel_qry = $conn->query("SELECT * FROM `ship_list` where id = '{$sched['ship_id']}' ");
 if($vessel_qry->num_rows > 0){
    foreach($vessel_qry->fetch_array() as $k => $v){
        $vessel[$k]=$v;
    }

}
?>
<style>
    #uni_modal .modal-footer{
        display:none;
    }
</style>
<div class="container-fluid" id="print_out">
    <div class="w-100 d-flex justify-content-end">
        <button class="btn btn-sm btn-success btn-flat mr-2" type="button" id="print"><i class="fa fa-print"></i> Print</button>
        <button class="btn btn-sm btn-light btn-flat mr-2" type="button" data-dismiss="modal"><i class="fa fa-times"></i> Close</button>
    </div>
    <style>
        .row>div{
            display:flex;
            align-items:center;
        }
        @media print{
            .btn{
                display:none!important;
            }
            html, body, .wrapper {
                min-height: unset !important;
            }
            .border-white{
                border-color:black !important;
            }
        }
    </style>
    <div class="w-100">
        <h4><b>Ticket #: <?php echo $ticket_number ?></b></h4>
    </div>
    <div class="row">
        <div class="col-3"><b>Departure Port (Date & Time): </b></div>
        <div class="col-9 border-bottom border-white"><?php echo $port_from ?> <?php echo date("M d, Y h:i A",strtotime($sched['departure_datetime'])) ?></div>
    </div>
    <div class="row">
        <div class="col-3"><b>Destination Port (Date & Time): </b></div>
        <div class="col-9 border-bottom border-white"><?php echo $port_to ?><?php echo date("M d, Y h:i A",strtotime($sched['arrival_datetime'])) ?></div>
    </div>
    <div class="row">
        <div class="col-3"><b>Vessel: </b></div>
        <div class="col-9 border-bottom border-white"><?php echo $vessel['id_code']. ' - '. $vessel['name'] ?></div>
    </div>
    <div class="row">
        <div class="col-3"><b>Passenger Name: </b></div>
        <div class="col-9 border-bottom border-white"><?php echo $name ?></div>
    </div>
    <div class="row">
        <div class="col-2"><b>Gender: </b></div>
        <div class="col-2  border-bottom border-white"><?php echo $gender ?></div>
        <div class="col-1"><b>DOB: </b></div>
        <div class="col-2  border-bottom border-white"><?php echo date("M d, Y",strtotime($dob)) ?></div>
        <div class="col-2"><b>Contact #: </b></div>
        <div class="col-2  border-bottom border-white"><?php echo $contact ?></div>
    </div>
    <div class="row">
        <div class="col-3"><b>Address: </b></div>
        <div class="col-9 border-bottom border-white"><?php echo $address ?></div>
    </div>
</div>
<script>
    $(function(){
        $('#print').click(function(){
            start_loader()
            var _el = $('<div>')
            var _head = $('head').clone()
            var p = $('#print_out').clone()
            p.find('.btn').remove()
            _el.append(_head)
            _el.append('<div class="d-flex justify-content-center row-cols-2">'+
                      '<div class="col-1 text-right">'+
                      '<img src="<?php echo validate_image($_settings->info('logo')) ?>" width="65px" height="65px" />'+
                      '</div>'+
                      '<div class="col-8">'+
                      '<h4 class="text-center"><?php echo $_settings->info('name') ?></h4>'+
                      '<h4 class="text-center">Reservation Ticket</h4>'+
                      '</div>'+
                      '</div><hr/>')
            _el.append(p.html())
            var nw = window.open("","","width=1200,height=900")
                     nw.document.write(_el.html())
                     nw.document.close()
                     setTimeout(() => {
                         nw.print()
                         setTimeout(() => {
                            nw.close()
                            end_loader()
                         }, 200);
                     }, 300);

        })
    })
</script>