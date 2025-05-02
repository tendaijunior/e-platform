<h1 class="text-light">Welcome to <?php echo $_settings->info('name') ?></h1>
<hr class="border-light">
<div class="row">
          <div class="col-12 col-sm-6 col-md-3">
            <div class="info-box">
              <span class="info-box-icon bg-light elevation-1"><i class="fas fa-clipboard-list"></i></span>

              <div class="info-box-content">
                <span class="info-box-text">Active Reservations</span>
                <span class="info-box-number">
                  <?php 
                    $reserve = $conn->query("SELECT * FROM reservations where `status` = 1 and schedule_id in (SELECT id FROM schedules where date(departure_datetime)> '".date('Y-m-d')."')  ")->num_rows;
                    echo number_format($reserve);
                  ?>
                  <?php ?>
                </span>
              </div>
              <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
          </div>
          <!-- /.col -->
          <div class="col-12 col-sm-6 col-md-3">
            <div class="info-box mb-3">
              <span class="info-box-icon bg-info elevation-1"><i class="fas fa-calendar-day"></i></span>

              <div class="info-box-content">
                <span class="info-box-text">Active Schedules</span>
                <span class="info-box-number">
                  <?php 
                    $sched = $conn->query("SELECT sum(id) as total FROM `schedules` where date(departure_datetime) > '".date("Y-m-d")."' ")->fetch_assoc()['total'];
                    echo number_format($sched);
                  ?>
                </span>
              </div>
              <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
          </div>
          <!-- /.col -->
        </div>
<div class="container">
  
</div>
