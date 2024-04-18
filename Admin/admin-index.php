 <!---------------- Session starts form here ----------------------->
 <?php 
    error_reporting(E_ALL); 
    ini_set('display_errors', 1);
    session_start();
    require_once "../connection/connection.php"; 
    $message = ""; // Initialize the message variable

    if(isset($_POST["btnlogin"])) {
        $username = $_POST["email"];
        $password = $_POST["password"];

        $query = "SELECT * FROM login WHERE user_id='$username'"; // Removed password from query
        $result = mysqli_query($con, $query);

        if ($result) {
            if (mysqli_num_rows($result) > 0) {
                while ($row = mysqli_fetch_array($result)) {
                    if ($password == $row["Password"]) { // For plain text password (not recommended)
                        if ($row["Role"] == "Admin") {
                            $_SESSION['LoginAdmin'] = $row["user_id"];
                            header('Location: ../admin/admin-index.php');
                            exit();
                        } else if ($row["Role"] == "Teacher" && $row["account"] == "Activate") {
                            $_SESSION['LoginTeacher'] = $row["user_id"];
                            header('Location: ../teacher/teacher-index.php');
                            exit();
                        } else if ($row["Role"] == "Student" && $row["account"] == "Activate") {
                            $_SESSION['LoginStudent'] = $row['user_id'];
                            header('Location: ../student/student-index.php');
                            exit();
                        }
                    } else {
                        $message = "Email Or Password Does Not Match";
                    }
                }
            } else {
                $message = "No user found with this email.";
            }
        } else {
            $message = "Query failed: " . mysqli_error($con);
        }
    }
?>
<!---------------- Session Ends form here ------------------------>
<title>Admin - SBU CMS</title>
	<?php include('../common/common-header.php') ?>
	<?php include('../common/admin-sidebar.php') ?>  
		<main role="main" class="col-xl-10 col-lg-9 col-md-8 ml-sm-auto px-md-4 mb-2 w-100 page-content-index">
			<div class="flex-wrap flex-md-no-wrap pt-3 pb-2 mb-3 text-white admin-dashboard pl-3">
				<h4>Admin Dashboard </h4>
			</div>
			<div class="row">
				<div class=" col-lg-6 col-md-12 col-sm-12 ">
					<div>
						<section class="mt-3">
							<div class="btn btn-block table-one text-light d-flex">
								<span class="font-weight-bold"><i class="fa fa-clock-o mr-2" aria-hidden="true"></i> Time Table</span>
								<a href="" class="ml-auto" data-toggle="collapse" data-target="#collapseOne"><i class="fa fa-plus text-light" aria-hidden="true"></i></a>
								
							</div>
							<div class="collapse show mt-2" id="collapseOne">
								<table class="w-100 table-elements table-one-tr"cellpadding="2">
									<tr class="pt-5 table-one text-white" style="height: 32px;">
										<th>Class Name</th>
										<th>Time</th>
										<th>Day</th>
										<th>Subject</th>
										<th>Room No</th>
									</tr>
									<?php  
										$query="select * from time_table tt inner join weekdays wd on tt.day=wd.day_id";
										$run=mysqli_query($con,$query);
										while($row=mysqli_fetch_array($run)) {
											echo "<tr>";
											echo "<td>".$row["course_code"]." ".$row["semester"]."</td>";
											echo "<td>".$row["timing_from"]."<br>".$row["timing_to"]."</td>";
											echo "<td>".$row["day_name"]."</td>";
											echo "<td>".$row["subject_code"]."</td>";
											echo "<td>".$row["room_no"]."</td>";
											echo "</tr>";
										}
									?>
								</table>
							</div>
						</section>
					</div>
				</div>
				<div class=" col-lg-6 col-md-12 col-sm-12">
					<div>
						<section class="mt-3">
							<div class="btn btn-block table-two text-light d-flex">
								<span class="font-weight-bold"><i class="fa fa-list-alt mr-2" aria-hidden="true"></i> Program List</span>
								<a href="" class="ml-auto" data-toggle="collapse" data-target="#collapsetwo"><i class="fa fa-plus text-light" aria-hidden="true"></i></a>
								
							</div>
							<div class="collapse show mt-2" id="collapsetwo">
								<table class="w-100 table-elements table-two-tr"cellpadding="2">
									<tr class="pt-5 table-two text-white" style="height: 32px;">
										<th>Course Code</th>
										<th>Course Name</th>
									</tr>
									<?php
										$query="select course_name,course_code from courses";
										$run=mysqli_query($con,$query);
										while($row=mysqli_fetch_array($run)) { ?>
											<tr>
												<td><?php echo $row['course_code'] ?></td>
												<td><?php echo $row['course_name'] ?></td>
											</tr>
										<?php } 
									?>
								</table>
							</div>
						</section>
					</div>
				</div>
				<div class="col-md-12">
					<div>
						<section class="mt-4">
							<div class="btn btn-block table-three text-light d-flex">
								<span class="font-weight-bold"><i class="fa fa-asterisk mr-2" aria-hidden="true"></i> Department Subject Detail</span>
								<a href="" class="ml-auto" data-toggle="collapse" data-target="#collapsethree"><i class="fa fa-plus text-light" aria-hidden="true"></i></a>
								
							</div>
							<div class="collapse show mt-2" id="collapsethree">
								<table class="w-100 table-elements table-three-tr"cellpadding="2">
									<tr class="pt-5 table-three text-white" style="height: 32px;">
										<th>Course Code</th>
										<th>Course Title</th>
										<th>Semester</th>
										<th>Total Subjects</th>
										<th>Total Credit Hours</th>
									</tr>
									<?php  
										$query="select course_code,course_name,semester,count(subject_code) as subject_code,sum(credit_hours) as credit_hours from course_subjects join courses using(course_code) group by course_code, semester";
										$run=mysqli_query($con,$query);
										while($row=mysqli_fetch_array($run)) {
											echo "<tr>";
											echo "<td>".$row["course_code"]."</td>";
											echo "<td>".$row["course_name"]."</td>";
											echo "<td>".$row["semester"]."</td>";
											echo "<td>".$row["subject_code"]."</td>";
											echo "<td>".$row["credit_hours"]."</td>";
											echo "</tr>";
										}
									?> 
								</table>
							</div>
						</section>
					</div>				
				</div>
			</div>	
		</main>
	
		<script type="text/javascript" src="../bootstrap/js/jquery.min.js"></script>
		<script type="text/javascript" src="../bootstrap/js/bootstrap.min.js"></script>
	</body>
</html>