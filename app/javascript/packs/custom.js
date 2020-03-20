// $(document).on(‘page: load’, validatearticleFunction);
$(document).ready(function () {
  $("#flush").hide();
  $("#operation_flush").hide();

  $(document).on('change', '#search_semester_id', function () {
    $(".my_th").hide();
    if ($("#search_branch_id").val() === "") {
      $('#search_semester_id').prop('selectedIndex', 0);
      alert("Please select branch!!");
    } else {
      $.ajax({
        type: "GET",
        url: " /admin/search_students",
        data: {
          branch_id: $("#search_branch_id").val(),
          semester_id: $("#search_semester_id").val()
        }
      });
    }
  });

  $(document).on('change', '#search_branch_faculty', function () {
    $.ajax({
      type: "GET",
      url: " /admin/search_by_branch",
      data: {
        branch_id: $("#search_branch_faculty").val()
      }
    });
  });

  $(document).on('keyup', '#search_enrollment', function () {
    $.ajax({
      type: "GET",
      url: " /admin/search_by_enrollment",
      data: {
        enrollment: $("#search_enrollment").val()
      },
      success: function (data) {
        $(".my_th").show();
        $('#search_branch_id').prop('selectedIndex', 0);
        $('#search_semester_id').prop('selectedIndex', 0);
      }
    });
  });

  $(document).on('change', '#semester_id', function () {
    // alert("hiiii");
    // debugger;
    $.ajax({
      type: "GET",
      url: "/admin/students_promote",
      data: {
        branch_id: $("#branch_id").val(),
        semester_id: $("#semester_id").val()
      },
      ContentType: "application/json; charset=utf-8",
      dataType: "json",
      success: function (data) {
        // debugger;
        if ($("#branch_id").val() === "") {
          $('#semester_id').prop('selectedIndex', 0);
          alert("Please select branch!!");
        } else {
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
            pass_out_year = "<td class='text-right'>" + data['name'][i]['pass_out_year'] + "</td>";
            // button_delete = "<td><a href='/students/" + data["name"][i]["id"] + "' data-method='delete' rel='nofollow' class='btn btn-outline-danger fa fa-trash'>delete</a></td>"
            string += "<tr><td>" + data["name"][i]["enrollment"] + "</td><td>" + data["name"][i]["fname"] + " " + data["name"][i]["lname"] + "</td>" + checkbox + pass_out_year + "</tr>";
          }
          if (data["name"].length == 0) {
            string = "<span style='color:red; font-weight: bold'>***Data not available</span>";
          }
          $("#users").html(string);
        }
      }
    });
  });
});
