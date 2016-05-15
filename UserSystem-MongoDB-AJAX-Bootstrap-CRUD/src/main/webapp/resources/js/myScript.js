
	function getUser(){
		var user = {
				"id" : $("#id").val(),
				"name" : $("#name").val(),
				"surname" : $("#surname").val(),
				"phoneNumber" : $("#phoneNumber").val(),	
		}
		return user;
	}	

	function getUserToCreate(){
		var user = {
				"id" : $("#cId").val(),
				"name" : $("#cName").val(),
				"surname" : $("#cSurname").val(),
				"phoneNumber" : $("#cPhoneNumber").val(),	
		}
		return user;
	}
	 function setContentUserToModal(userId){
		$("#id").val($("#content_" + userId + "_id").text());
		$("#name").val($("#content_" + userId + "_name").text());
		$("#surname").val($("#content_" + userId + "_surname").text());
		$("#phoneNumber").val($("#content_" + userId + "_phoneNumber").text());
		
	}; 
	

	 function setDataToList(user){
		
		console.log(user);
		$("#content_" + user.id + "_id").text(user.id);
		$("#content_" + user.id + "_name").text(user.name);
		$("#content_" + user.id + "_surname").text(user.surname);
		$("#content_" + user.id + "_phoneNumber").text(user.phoneNumber);
		
	}; 
    

	//Validation
	function submitEditFormValid() {

		var name = $('#name').val().trim();
		var surname = $('#surname').val().trim();
		var phoneNumber = $('#phoneNumber').val().trim();

		if (name.length == 0) {
			alert('Please entry name!');
			$('#name').focus();
			return false;
		}

		if (surname.length == 0) {
			alert('Please entry surname!');
			$('#surname').focus();
			return false;
		}
		return true;
	};
    

	//Validation
	function submitCreateFormValid() {

		var name = $('#cName').val().trim();
		var surname = $('#cSurname').val().trim();
		var phoneNumber = $('#cPhoneNumber').val().trim();

		if (name.length == 0) {
			alert('Please entry name!');
			$('#name').focus();
			return false;
		}

		if (surname.length == 0) {
			alert('Please entry surname!');
			$('#surname').focus();
			return false;
		}
		return true;
	};
	
	
    $( document ).ready(function() {
    	
        $("#btnEditFormPost").click(function () {
        	if(submitEditFormValid()==false){
        		return;
        	}
        	
        	var user = getUser();
        	console.log(user);
            $.ajax({
                type: "POST",
                contentType:"application/json; charset=utf-8",
                dataType:"json",
                url: "http://localhost:8080/update",
                data:JSON.stringify(user),
                success: function(response){
              		console.log(response);
              	setDataToList(response);
              	alert(response.name+" "+"was updated");
                }
            }
            );//ajax finish
        });//click finish
        

     
        $('[name=btnEdit]').on('click', function () {

            var userid =$(this).attr('userid');
        	console.log(userid);
        	setContentUserToModal(userid)
        });
        
        $("#btnCreateFormPost").click(function () {
        	if(submitCreateFormValid()==false){
        		return;
        	}
        	var user = getUserToCreate();
            $.ajax({
               
            	type: "POST",
                contentType:"application/json; charset=utf-8",
                dataType:"json",
                url: "http://localhost:8080/save",
                data:JSON.stringify(user),
                success: function(response){
              		console.log(response);
              	setDataToList(response);
              	alert(response.name+" "+"was added");
              		
                }
            }
            );//ajax finish
        });//click finish
    
        
        $('[name=btnDelete]').on('click', function () {
        	if (confirm('Are you sure you want to delete this?')){
				 var id =$(this).attr('userid');
				 console.log(id);				
			            $.ajax({
			                type: "POST",
			                contentType:"application/json; charset=utf-8",
			                dataType: "json",
			                url: "http://localhost:8080/delete",
			                data:JSON.stringify(id),
			                success: function(response){
			                alert("was deleted");
			                }
			              
			            }
			            );//ajax finish
        	}
			        });//click finish
			 
			        
		
    });


