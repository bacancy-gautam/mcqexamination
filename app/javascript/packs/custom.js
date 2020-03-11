
$(document).ready(function () {

  $("#check").change(function(){
    alert("Hii");
  });

  $("#branch_id").on("change",function () {
    alert("hiiii");
  
  $.ajax({
  type: "GET",
  url: " /admin/search",
  data: {branch_id: $("#branch_id").val()},
  ContentType: "application/json; charset=utf-8",
  dataType: "json",
  success: function(data){
    // debugger
    var i;
    var string = "";
    var checkbox="";
    var textfield="";
    // for i in data["name"].length()
    for(i=0; i<data["name"].length; i++)
    {
      // debugger
      textfield="<tr><td><input type='hidden' id='"+ data["name"][i]["id"] +"' name='"+ data["name"][i]["id"] +"' value='"+ data["name"][i]["id"] +"'></input>"; 
      checkbox = "<input type='checkbox' id='check' name='check' value='"+ data["name"][i]["id"] +"'></input>"; 
      string +=  textfield +checkbox+data["name"][i]["email"] +"</td></tr>";
      
      }
  
    $("#users").html(string);
  // var optionString="<option value=''>Select Sub-Category</option>";
  // optionString += "<option value='" + data.result['id'] + "'>"
  // + data.result['name'] + "</option>";
  // $("#123").html(data["name"][0]["email"]);
  }
  });
  });
});
