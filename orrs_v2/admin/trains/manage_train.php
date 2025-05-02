<?php
require_once('../../config.php');
if(isset($_GET['id'])){
    $qry = $conn->query("SELECT * FROM `course_list` where id = '{$_GET['id']}'");
    if($qry->num_rows > 0){
        $res = $qry->fetch_array();
        foreach($res as $k => $v){
            if(!is_numeric($k))
            $$k = $v;
        }
    }
}
?>
<div class="container-fluid">
    <form action="" id="course-form">
        <input type="visible" name="id" value="<?php echo isset($id) ? $id : '' ?>">
        <div class="form-group">
            <label for="code" class="control-label">Course #</label>
            <input type="text" pattern="[a-zA-z0-9_-]+" name="code" id="code" class="form-control form-control-border" placeholder="Enter Unique Code" value ="<?php echo isset($code) ? $code : '' ?>" required>
            <small class='muted'><em>Spaces and special characters except (-_) are not allowed in this field.</em></small>
        </div>
        <div class="form-group">
            <label for="name" class="control-label">Name</label>
            <input type="text" name="name" id="name" class="form-control form-control-border" placeholder="Enter course Name" value ="<?php echo isset($name) ? $name : '' ?>" required>
        </div>
        <div class="form-group">
            <label for="premium_class_capacity" class="control-label">First Class Seat Capacity</label>
            <input type="number" name="premium_class_capacity" id="premium_class_capacity" class="form-control form-control-border text-right" value ="<?php echo isset($premium_class_capacity) ? $premium_class_capacity : 0 ?>" required>
        </div>
        <div class="form-group">
            <label for="standard_capacity" class="control-label">Economy Seat Capacity</label>
            <input type="number" name="standard_capacity" id="standard_capacity" class="form-control form-control-border text-right" value ="<?php echo isset($standard_capacity) ? $standard_capacity : 0 ?>" required>
        </div>
    </form>
</div>
<script>
    $(function(){
        $('#uni_modal #course-form').submit(function(e){
            e.preventDefault();
            var _this = $(this)
            $('.pop-msg').remove()
            var el = $('<div>')
                el.addClass("pop-msg alert")
                el.hide()
            start_loader();
            $.ajax({
                url:_base_url_+"classes/Master.php?f=save_train",
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
                    if(resp.status == 'success'){
                        location.reload();
                    }else if(!!resp.msg){
                        el.addClass("alert-danger")
                        el.text(resp.msg)
                        _this.prepend(el)
                    }else{
                        el.addClass("alert-danger")
                        el.text("An error occurred due to unknown reason.")
                        _this.prepend(el)
                    }
                    el.show('slow')
                    $('html,body,.modal').animate({scrollTop:0},'fast')
                    end_loader();
                }
            })
        })
    })
</script>