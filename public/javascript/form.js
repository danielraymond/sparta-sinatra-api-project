function formValidation(evt)
{
  var name = document.newPlanet.title

  if (name_validation(name)) {
  }
  return false;
}

function name_validation(name)
{
  var name_type = (typeof name.value);
  parseFloat(name_type)
  if (name_type != "string")
  {
    $('.name-error').css("display", "inline-block");
    $(document).on("submit", "form", function(e){
    e.preventDefault();
    alert("Invalid name")
    return  false;
    });
  }
  return true;
}
