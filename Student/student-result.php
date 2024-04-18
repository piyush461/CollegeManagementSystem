<?php  
	session_start();
	if (!$_SESSION["LoginStudent"])
	{
		header('location:../login/login.php');
	}
	require_once "../connection/connection.php";
?>

<!doctype html>
<html lang="en">
<head>
	<title>Student - Results</title>
</head>
<body>
	<?php include('../common/common-header.php') ?>
	<?php include('../common/student-sidebar.php') ?>  

	<main role="main" class="col-xl-10 col-lg-9 col-md-8 ml-sm-auto px-md-4 mb-2 w-100'>
		<div class="sub-main">
			<div class="text-center d-flex flex-wrap flex-md-nowrap pt-3 pb-2 mb-3 text-white admin-dashboard pl-3">
				<h4 class="">Student Result Summary</h4>
			</div>
			<div class="row">
				<div class="col-md-12">
					<section class="mt-3">
						<table class="w-100 table-elements mb-5 table-three-tr" cellpadding="10" >
						<tr class="text-center text-white table-three table-tr-head" style="background-color: #4477CE !important;;">
							<th>Semester</th>
							<th>Course</th>
							<th>Subject</th>
							<th>Cr.Hr</th>
							<th>Total Marks</th>
							<th>Obtain Marks</th>
							<th>Grade</th>
							<th>CGPA</th>
						</tr>

							<?php 
							$final_cgpa = 0;
							$total_cgpa = 0;
							$total_subjects = 0;
							$total_credits = 0;
							$total_obtain_marks = 0;
							$total_total_marks = 0;
							$count = 0;
							$roll_no = $_SESSION['LoginStudent'];
							$query = "SELECT * FROM class_result cr 
								INNER JOIN course_subjects cs ON cr.subject_code = cs.subject_code 
								WHERE cr.roll_no = '$roll_no'";
									$run = mysqli_query($con,$query);
									while ($row = mysqli_fetch_array($run)) { 
								$count++; 
								$total_subjects++;
								$total_credits += $row['credit_hours'];
								$total_obtain_marks += $row['obtain_marks'];
								$total_total_marks += $row['total_marks'];

								$credits = 0;
								$gpa = 0;

								$score = 0;
								$obtain_marks = $row['obtain_marks'];
								$total_marks = $row['total_marks'];
								
								if ($obtain_marks > 85) {
									$grade = 'A+';
									$credits = 4.0;
								} elseif ($obtain_marks > 80) {
									$grade = 'A';
									$credits = 4.0;
								} elseif ($obtain_marks > 75) {
									$grade = 'B+';
									$credits = 3.7;
								} elseif ($obtain_marks > 70) {
									$grade = 'B';
									$credits = 3.3;
								} elseif ($obtain_marks > 65) {
									$grade = 'C+';
									$credits = 3.0;
								} elseif ($obtain_marks > 60) {
									$grade = 'C';
									$credits = 2.7;
								} elseif ($obtain_marks > 55) {
									$grade = 'D+';
									$credits = 2.5;
								} elseif ($obtain_marks > 50) {
									$grade = 'D';
									$credits = 2.0;
								} else {
									$grade = 'F';
									$credits = 0.0;
								}
								
								$score = $credits * $row['credit_hours'];
								$gpa += $score;
								$total_cgpa += $obtain_marks / $total_marks * 10; 
								
								// Display the result for each subject
								echo "<tr class='text-center'>
										<td>{$row['semester']}</td>
										<td>{$row['course_code']}</td>
										<td>{$row['subject_code']}</td>
										<td>{$row['credit_hours']}</td>
										<td>{$row['total_marks']}</td>
										<td>{$obtain_marks}</td>
										<td>{$grade}</td>
										<td>" . round($obtain_marks / $total_marks * 10, 2) . "</td> 
									</tr>";
							}

							// Calculate final CGPA
							$final_cgpa = $total_subjects > 0 ? round($total_cgpa / $total_subjects, 2) : 0;
							?>
							<tr class="text-white bg-success text-center">
								<td colspan="2"><?php echo "FINAL RESULT " ?></td>
								<td><?php echo $count; ?></td>
								<td><?php echo $total_credits; ?></td>
								<td><?php echo $total_total_marks; ?></td>
								<td><?php echo $total_obtain_marks; ?></td>
								<?php  
									$marks_grade = $total_total_marks > 0 ? ($total_obtain_marks * 100) / $total_total_marks : 0;
									$final_grade = '';
									if ($marks_grade > 85) {
										$final_grade = 'A+';
									} elseif ($marks_grade > 80) {
										$final_grade = 'A';
									} elseif ($marks_grade > 75) {
										$final_grade = 'B+';
									} elseif ($marks_grade > 70) {
										$final_grade = 'B';
									} elseif ($marks_grade > 65) {
										$final_grade = 'C+';
									} elseif ($marks_grade > 60) {
										$final_grade = 'C';
									} elseif ($marks_grade > 55) {
										$final_grade = 'D+';
									} elseif ($marks_grade > 50) {
										$final_grade = 'D';
									} else {
										$final_grade = 'F';
									}
								?>
								<td><?php echo $final_grade ?></td>
								<td><?php echo $final_cgpa ?></td>
							</tr>
						</table>	
					</section>
				</div>
			</div>
		</div>
	</main>
</body>
</html>
