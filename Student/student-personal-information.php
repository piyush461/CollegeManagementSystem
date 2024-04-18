<?php
    // Start the session
    session_start();

    // Check if the user is logged in
    if (!isset($_SESSION["LoginStudent"]) || empty($_SESSION["LoginStudent"])) {
        // Redirect to the login page if the user is not logged in
        header('location:../login/login.php');
        exit; // Stop further execution
    }

    // Include the database connection file
    require_once "../connection/connection.php";

    // Check if the form is submitted
    if (isset($_POST['sub'])) {
        // Retrieve form data
        $first_name = isset($_POST['first_name']) ? $_POST['first_name'] : '';
        $middle_name = isset($_POST['middle_name']) ? $_POST['middle_name'] : '';
        $last_name = isset($_POST['last_name']) ? $_POST['last_name'] : '';
        $mobile_no = isset($_POST['mobile_no']) ? $_POST['mobile_no'] : '';
        $gender = isset($_POST['gender']) ? $_POST['gender'] : '';
		$dob = isset($_POST['dob']) ? $_POST['dob'] : '';
        $semester = isset($_POST['semester']) ? $_POST['semester'] : '';
        $total_marks = isset($_POST['total_marks']) ? $_POST['total_marks'] : '';
        $obtain_marks = isset($_POST['obtain_marks']) ? $_POST['obtain_marks'] : '';
        $current_address = isset($_POST['current_address']) ? $_POST['current_address'] : '';
        $state = isset($_POST['state']) ? $_POST['state'] : '';

        // Retrieve roll number from session
        $roll_no = $_SESSION['LoginStudent'];

        // Update the student information in the database
        $query = "UPDATE student_info SET first_name='$first_name', middle_name='$middle_name', last_name='$last_name', mobile_no='$mobile_no', gender='$gender', semester='$semester', total_marks='$total_marks', obtain_marks='$obtain_marks', state='$state' WHERE roll_no='$roll_no'";
        $run = mysqli_query($con, $query);

        // Check if the query executed successfully
        if ($run) {  
            echo "<script>alert('Student data has been updated');</script>";
        } else {
            echo "<script>alert('Student data has not been updated due to some errors');</script>";
        }
    }
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Student Personal Information</title>
</head>
<body>
    <?php include('../common/common-header.php') ?>
    <?php include('../common/student-sidebar.php') ?>  

    <main role="main" class="col-xl-10 col-lg-9 col-md-8 ml-sm-auto px-md-4 w-100">
        <div class="sub-main sub-main-student">
            <div class="text-center d-flex flex-wrap flex-md-nowrap pt-3 pb-2 mb-3 text-white admin-dashboard pl-3">
                <h4 class="">Update Your Personal Information </h4>
            </div>
            <div class="row ml-4">
                <div class="col-lg-12 col-md-12 col-sm-12">
                    <form action="student-personal-information.php" method="post">
                        <?php 
                            // Retrieve student information from the database
                            $roll_no = $_SESSION['LoginStudent'];
                            $query = "SELECT * FROM student_info WHERE roll_no='$roll_no'";
                            $run = mysqli_query($con, $query);
                            $row = mysqli_fetch_array($run);
                        ?>
                        <div class="row">
                            <div class=" col-lg-6 col-md-6 pr-5">
                                <div class="form-group">
                                    <label for="First Name">First Name:*</label>
                                    <input type="text" class="form-control" name="first_name" value="<?php echo isset($row['first_name']) ? $row['first_name'] : '' ?>">
                                </div>
                            </div>
                            <div class=" col-lg-6 col-md-6 pr-5">
                                <div class="form-group">
                                    <label for="Middle Name">Middle Name:*</label>
                                    <input type="text" class="form-control" name="middle_name" value="<?php echo isset($row['middle_name']) ? $row['middle_name'] : '' ?>">
                                </div>
							</div>
							<div class=" col-lg-6 col-md-6 pr-5">
                                <div class="form-group">
                                    <label for="Last Name">Last Name:*</label>
                                    <input type="text" class="form-control" name="last_name" value="<?php echo isset($row['last_name']) ? $row['last_name'] : '' ?>">
                                </div>
                            </div>
							<div class=" col-lg-6 col-md-6 pr-5">
                                <div class="form-group">
                                    <label for="mobile">Mobile No:*</label>
                                    <input type="text" class="form-control" name="mobile_no" value="<?php echo isset($row['mobile_no']) ? $row['mobile_no'] : '' ?>">
                                </div>
                            </div>
							<div class=" col-lg-6 col-md-6 pr-5">
							<div class="form-group">
								<label for="gender">Gender:*</label>
								<select class="form-control" name="gender">
									<option value="male" <?php echo (isset($row['gender']) && $row['gender'] == 'male') ? 'selected' : ''; ?>>Male</option>
									<option value="female" <?php echo (isset($row['gender']) && $row['gender'] == 'female') ? 'selected' : ''; ?>>Female</option>
								</select>
							</div>
						</div>

						<div class=" col-lg-6 col-md-6 pr-5">
							<div class="form-group">
								<label for="dateofbirth">Date of Birth:*</label>
								<input type="date" class="form-control" name="dob" value="<?php echo isset($row['dob']) ? $row['dob'] : '' ?>">
							</div>
						</div>

                        </div>
                        <!-- Remaining form fields -->
                        <div class="row mt-3">
                            <div class="col-lg-6 col-md-6 offset-4">
                                <input type="submit" name="sub" class="btn btn-primary" value="Update Information">
                            </div>
                        </div>
                    </form>
                </div>
            </div>  
        </div>
    </main>
    <script type="text/javascript" src="../bootstrap/js/jquery.min.js"></script>
    <script type="text/javascript" src="../bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
