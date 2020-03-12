
$(document).ready(function () {

  $("#semester_id").on("change",function () {
    // alert("hiiii");
    // debugger;
    $.ajax({
    type: "GET",
    url: " /admin/search",
    data: {branch_id: $("#branch_id").val(), semester_id: $("#semester_id").val()},
    ContentType: "application/json; charset=utf-8",
    dataType: "json",
    success: function(data){
      if($("#branch_id").val() === "") {
        $('#semester_id').prop('selectedIndex',0);
        alert("Please select branch!!");
      }
      else{
      // debugger
        var i;
        var  string = "";
        var checkbox="";
        var textfield="";
        for(i=0; i<data["name"].length; i++)
        {
          // debugger
          checkbox = "<td><input type='checkbox' id='"+ data["name"][i]["id"] +"' name='student_ids["+ data["name"][i]["id"] +"]' value='"+ data["name"][i]["id"] +"'></input></td>"; 
          string +=  "<tr><td>"+ data["name"][i]["enrollment"] +"</td>"+ checkbox +"</tr>";
        }
        $("#users").html(string);
      }
    }

    });
  });
  
});
