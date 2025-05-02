<?php require_once('../../config.php'); ?>
<table class="table table-bordered table-stripped table-hovered">
    <colgroup>
        <col width="5%">
        <col width="40%">
        <col width="40%">
        <col width="15%">
    </colgroup>
    <thead>
        <tr>
            <th></th>
            <th class="py-1 px-2 text-center">Accomodation</th>
            <th class="py-1 px-2 text-center">Description</th>
            <th class="py-1 px-2 text-center">Net Fare</th>
        </tr>
    </thead>
    <tbody>
        <?php 
        $accom_qry = $conn->query("SELECT sa.*,a.accommodation,a.description FROM sched_accom sa inner join `accommodations` a on sa.accommodation_id = a.id where sa.schedule_id = '{$_GET['id']}' order by `id` asc");
            while($row = $accom_qry->fetch_assoc()):
        ?>
        <tr>
            <td class="text-center py-1 px-2">
            <div class="icheck-primary d-inline">
                <input type="radio" id="accom_<?php echo $row['id'] ?>" name="accommodation_id" value="<?php echo $row['accommodation_id'] ?>" required>
                <label for="accom_<?php echo $row['id'] ?>">
                </label>
            </div>
            </td>
            <td class=" py-1 px-2"><?php echo $row['accommodation'] ?></td>
            <td class=" py-1 px-2"><?php echo $row['description'] ?></td>
            <td class="text-right py-1 px-2"><?php echo number_format($row['net_fare']) ?></td>
        </tr>
        <?php endwhile; ?>
    </tbody>
</table>