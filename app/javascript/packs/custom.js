// $(document).on(‘page: load’, validatearticleFunction);
$(document).ready(function () {
  $("#flush").hide();
  $("#operation_flush").hide();
  $("#semester_id").on("change", function () {
    // alert("hiiii");
    // debugger;
    $.ajax({
      type: "GET",
      url: " /admin/search",
      data: { branch_id: $("#branch_id").val(), semester_id: $("#semester_id").val() },
      ContentType: "application/json; charset=utf-8",
      dataType: "json",
      success: function (data) {
        if ($("#branch_id").val() === "") {
          $('#semester_id').prop('selectedIndex', 0);
          alert("Please select branch!!");
        }
        else {
          // debugger
          if ($("#semester_id").val() == 1) {
            $("#operation_demote").hide("slow");
            $("#operation_promote").prop("checked", true);
            $("#demote").hide("slow");
            $("#promote").show("slow");
            $("#operation_promote").show("slow");
          } else if ($("#semester_id").val() == 8) {
            $("#operation_promote").hide("slow");
            $("#demote").show("slow");
            $("#promote").hide("slow");
            $("#operation_demote").prop("checked", true);
            $("#operation_demote").show("slow");
          } else {
            $("#operation_promote").show("slow");
            $("#operation_demote").show("slow");
            $("#operation_promote").prop("checked", true);
            $("#demote").show("slow");
            $("#promote").show("slow");
          }
          var i;
          var string = "";
          var checkbox = "";
          var textfield = "";
          for (i = 0; i < data["name"].length; i++) {
            // debugger

            checkbox = "<td><input type='checkbox' id='" + data["name"][i]["id"] + "' name='student_ids[" + data["name"][i]["id"] + "]' value='" + data["name"][i]["id"] + "'></input></td>";
            pass_out_year = "<td class='text-right'>"+data['name'][i]['pass_out_year']+"</td>";
            // button_delete = "<td><a href='/students/" + data["name"][i]["id"] + "' data-method='delete' rel='nofollow' class='btn btn-outline-danger fa fa-trash'>delete</a></td>"
            string += "<tr><td>" + data["name"][i]["enrollment"] + "</td><td>"+ data["name"][i]["fname"] + " " + data["name"][i]["lname"] + "</td>" + checkbox + pass_out_year + "</tr>";
          }
          if(data["name"].length == 0){
            string = "<span style='color:red; font-weight: bold'>***Data not available</span>";
          }
          $("#users").html(string);
        }
      }

    });
  });

  $("#search_semester_id").on("change", function () {
    // alert("hiiii");
    // debugger;
    // $('#search_enrollment').prop("");
    $.ajax({
      type: "GET",
      url: " /admin/search",
      data: { branch_id: $("#search_branch_id").val(), semester_id: $("#search_semester_id").val() },
      ContentType: "application/json; charset=utf-8",
      dataType: "json",
      success: function (data) {
        if ($("#search_branch_id").val() === "") {
          $('#search_semester_id').prop('selectedIndex', 0);
          alert("Please select branch!!");
        }
        else {
          // $("#users").remove();
          // debugger
          var i;
          var string = "";
          var checkbox = "";
          var textfield = "";
          for (i = 0; i < data["name"].length; i++) {
            // debugger
            emaill = "<td>" + data['name'][i]['email'] + "</td>";
            // checkbox = "<td><input type='checkbox' id='" + data["name"][i]["id"] + "' name='student_ids[" + data["name"][i]["id"] + "]' value='" + data["name"][i]["id"] + "'></input></td>";
            pass_out_year = "<td class='text-center'>"+data['name'][i]['pass_out_year']+"</td>";
            button_delete = "<td><a href='/students/" + data["name"][i]["id"] + "' data-method='delete' rel='nofollow' class='btn btn-outline-danger fa fa-trash' title='Delete the student'>delete</a></td>"
            string += "<tr><td>" + data["name"][i]["enrollment"] + "</td><td>"+ data["name"][i]["fname"] + " " + data["name"][i]["lname"] + "</td>" + emaill + pass_out_year + button_delete + "</tr>";
          }
          if(data["name"].length == 0){
            string = "<span style='color:red; font-weight: bold'>***Data not available</span>";
          }
          $("#users").html(string);
        }
      }

    });
  });

  //-------------------------

  $("#search_branch_faculty").on("change", function () {
    // alert("hiiii");
    // debugger;
    // $('#search_enrollment').prop("");
    $.ajax({
      type: "GET",
      url: " /admin/search_by_branch",
      data: { branch_id: $("#search_branch_faculty").val() },
      ContentType: "application/json; charset=utf-8",
      dataType: "json",
      success: function (data) {
          // $("#users").remove();
          // debugger
          var i;
          var string = "";
          var checkbox = "";
          var textfield = "";
          for (i = 0; i < data["name"].length; i++) {
            // debugger
            fname = "<td>" + data['name'][i]['fname'] + "</td>";
            lname = "<td>" + data['name'][i]['lname'] + "</td>";
            emaill = "<td>" + data['name'][i]['email'] + "</td>";
            branch = "<td>" + data['name'][i]['branch'] + "</td>";
            mobile = "<td>" + data['name'][i]['mobile'] + "</td>";
            edit_btn = "<td><a class='genric-btn info-border radius medium fa fa-pencil-square-o' title='Edit faculty' href='/faculties/" + data["name"][i]["id"] + "/edit'>Edit</a></td>";
            delete_btn = "<td><a data-confirm='Are you sure?' class='genric-btn danger-border radius medium fa fa-trash' title='Delete faculty' rel='nofollow' data-method='delete' href='/faculties/" + data["name"][i]["id"] + "'>Delete</a></td>";
            // checkbox = "<td><input type='checkbox' id='" + data["name"][i]["id"] + "' name='student_ids[" + data["name"][i]["id"] + "]' value='" + data["name"][i]["id"] + "'></input></td>";
            // pass_out_year = "<td class='text-center'>"+data['name'][i]['pass_out_year']+"</td>";
            // button_delete = "<td><a href='/students/" + data["name"][i]["id"] + "' data-method='delete' rel='nofollow' class='btn btn-outline-danger fa fa-trash' title='Delete the student'>delete</a></td>"
            string += "<tr>" + fname + lname + emaill + branch + mobile + edit_btn + delete_btn + "</tr>";
          }
          if(data["name"].length == 0){
            string = "<span style='color:red; font-weight: bold'>***Data not available</span>";
          }
          $("#faculty_list_body").html(string); 
      }
    });
  });

  $("#search_enrollment").on("keyup", function () {
    // alert("hiiii");
    // debugger;
    // alert("hello");
    $.ajax({
      type: "GET",
      url: " /admin/search_by_enrollment",
      data: { enrollment: $("#search_enrollment").val()},
      ContentType: "application/json; charset=utf-8",
      dataType: "json",
      success: function (data) {
        // debugger;
        // if ($("#search_branch_id").val() === "") {
        //   $('#search_semester_id').prop('selectedIndex', 0);
        //   alert("Please select branch!!");
        // }
        // else {
          // $("#users").remove();
          // debugger
          var i;
          var string = "";
          var checkbox = "";
          var textfield = "";
          for (i = 0; i < data["name"].length; i++) {
            // debugger

            // checkbox = "<td><input type='checkbox' id='" + data["name"][i]["id"] + "' name='student_ids[" + data["name"][i]["id"] + "]' value='" + data["name"][i]["id"] + "'></input></td>";
            pass_out_year = "<td class='text-center'>"+data['name'][i]['pass_out_year']+"</td>";
   
            emaill = "<td>" + data['name'][i]['email'] + "</td>";
            button_delete = "<td><a href='/students/" + data["name"][i]["id"] + "' data-method='delete' rel='nofollow' class='btn btn-outline-danger fa fa-trash' title='Delete the student'>delete</a></td>"
            string += "<tr><td>" + data["name"][i]["enrollment"] + "</td><td>"+ data["name"][i]["fname"] + " " + data["name"][i]["lname"] + "</td>" + emaill + pass_out_year + button_delete + "</tr>";
          }
          if(data["name"].length == 0){
            string = "<span style='color:red; font-weight: bold'>***Data not available</span>";
            $('#search_semester_id').prop('selectedIndex', 0);
            $('#search_branch_id').prop('selectedIndex', 0);
          }else{
            $('#search_semester_id').prop('selectedIndex', data["name"][0]["semester_id"]);
            $('#search_branch_id').prop('selectedIndex', data["name"][0]["branch_id"]);
          }
          $("#users").html(string);
        // }
      }

    });
  });

});
