<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin - Student Attendance</title>
</head>
<body>
<?php  
    session_start();
    if (!isset($_SESSION["LoginAdmin"]) || !$_SESSION["LoginAdmin"]) {
        header('location:../login/login.php');
        exit; // Added exit to stop further execution
    }
    require_once "../Connection/connection.php";

    if (isset($_POST['sub'])) {
        $count = isset($_POST['count']) ? $_POST['count'] : 0; // Initialize count variable
        for ($i = 0; $i < $count; $i++) {  
            $date = date("d-m-y");
            $que = "INSERT INTO student_attendance (course_code, subject_code, semester, student_id, attendance, attendance_date) VALUES ('".$_POST['course_code'][$i]."','".$_POST['subject_code'][$i]."','".$_POST['semester'][$i]."','".$_POST['roll_no'][$i]."','".$_POST['attendance'][$i]."','$date')";
            $run = mysqli_query($con, $que);
            if ($run) {
                echo "Insert Successfully";
            } else {
                echo "Insert Not Successfully";
            }
        }
    }
?>

<?php include('../common/common-header.php') ?>
<?php include('../common/admin-sidebar.php') ?>  

<main role="main" class="col-xl-10 col-lg-9 col-md-8 ml-sm-auto px-md-4 mb-2 w-100">
    <div class="sub-main">
        <div class="bar-margin text-center d-flex flex-wrap flex-md-nowrap pt-3 pb-2 mb-3 text-white admin-dashboard pl-3">
            <h4>Student Attendance Management System</h4>
        </div>
        <div class="row w-100">
            <div class="col-md-12">
                <form action="student-attendance.php" method="post">
                    <div class="row mt-3">
                        <div class="col-md-4">
                            <div class="form-group" style="z-index: 10;">
                                <label>Enter Class Id:</label>
                                <select class="browser-default custom-select" name="course_code">
                                    <option>Select Course</option>
                                    <?php
                                    $teacher_id = $_SESSION['teacher_id'];
                                    $query = "SELECT DISTINCT(course_code) AS course_code FROM time_table";
                                    $run = mysqli_query($con, $query);
                                    while ($row = mysqli_fetch_array($run)) {
                                        echo "<option value='".$row['course_code']."'>".$row['course_code']."</option>";
                                    }
                                    ?>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="exampleInputEmail1">Select Semester:</label>
                                <select class="browser-default custom-select" name="semester">
                                    <option>Select Semester</option>
                                    <?php
                                    $teacher_id = $_SESSION['teacher_id'];
                                    $query = "SELECT DISTINCT(semester) AS semester FROM course_subjects";
                                    $run = mysqli_query($con, $query);
                                    while ($row = mysqli_fetch_array($run)) {
                                        echo "<option value='".$row['semester']."'>".$row['semester']."</option>";
                                    }
                                    ?>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>Enter Subject:</label>
                                <select class="browser-default custom-select" name="subject_code" required="">
                                    <option>Select Subject</option>
                                    <?php
                                    $teacher_id = $_SESSION['teacher_id'];
                                    $query = "SELECT subject_code FROM time_table";
                                    $run = mysqli_query($con, $query);
                                    while ($row = mysqli_fetch_array($run)) {
                                        echo "<option value='".$row['subject_code']."'>".$row['subject_code']."</option>";
                                    }
                                    ?>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <input type="submit" name="sub" class="btn btn-primary px-5" value="Confirm">
                        </div>
                    </div>    
                </form>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <section class="border mt-3">
                    <table class="w-100 table-elements table-three-tr" cellpadding="3" >
                        <tr class="table-tr-head table-three text-white" style="background-color: #512B81 !important">
                            <th>Sr.No</th>
                            <th>Roll No</th>
                            <th>Course Name</th>
                            <th>Subject Name</th>
                            <th>Semester</th>
                            <th>Student Name</th>
                            <th>Present/Absent</th>
                            <th>Percentage</th>
                            <th>Add Attendance</th>
                        </tr>
                        <?php  
                        $i = 1;
                        if (isset($_POST['submit'])) {
                            $course_code = $_POST['course_code'];
                            $semester = $_POST['semester'];
                            $subject_code = $_POST['subject_code'];
                            $query = "SELECT student_info.roll_no, first_name, middle_name, last_name, student_courses.semester, student_courses.course_code, subject_code FROM student_courses INNER JOIN student_info ON student_info.roll_no = student_courses.roll_no WHERE student_courses.course_code = '$course_code' AND student_courses.semester = '$semester' AND student_courses.subject_code = '$subject_code'";
                            $run = mysqli_query($con, $query);
                            while ($row = mysqli_fetch_array($run)) {
                                ?>
                                <form action="student-attendance.php" method="post">
                                    <tr>
                                        <td><?php echo $i++ ?></td>
                                        <td><?php echo $row['roll_no'] ?></td>
                                        <input type="hidden" name="roll_no[]" value="<?php echo $row['roll_no'] ?>" >
                                        <td><?php echo $row['course_code'] ?></td>
                                        <input type="hidden" name="course_code[]" value="<?php echo $row['course_code'] ?>" >
                                        <td><?php echo $row['subject_code'] ?></td>
                                        <input type="hidden" name="subject_code[]" value="<?php echo $row['subject_code'] ?>" >
                                        <td><?php echo $row['semester'] ?></td>
                                        <input type="hidden" name="semester[]" value="<?php echo $row['semester'] ?>" >
                                        <td><?php echo $row['first_name']." ".$row['middle_name']." ".$row['last_name'] ?></td>
                                        <td>
                                            Present<input type="checkbox" name="attendance[]" value="1">
                                            Absent<input type="checkbox" name="attendance[]" value="0">
                                        </td>
                                    </tr>
                                    <input type="hidden" name="count" value="1"> <!-- Fixed count value -->
                                <?php
                            }
                        }
                        ?>
                    </table>                
                </section>
            </div>
        </div>
    </div>
</main>
<script type="text/javascript" src="../bootstrap/js/jquery.min.js"></script>
<script type="text/javascript" src="../bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
