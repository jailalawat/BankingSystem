$(document).ready(function(){
	$("#new_transaction").submit(function(event) {
		event.preventDefault(); //this will prevent the default submit
		transaction_amount = $("#transaction_amount").val();
		account_balance = $("#account_balance").val();
		transaction_type = $("#transaction_transaction_type").val();
		if(transaction_type=="DR" && (transaction_amount > account_balance)){
			jQuery.gritter.add({ image: '/assets/error.png', title: 'Please fix error!', text: 'Your withdrawl amount is more than account balance' });
			// console.log($("#submit-btn").prop('disabled'));
			setTimeout(function () {
        $("#submit-btn").attr('disabled', false);
      }, 500)
		}else{
			$(this).unbind('submit').submit(); // continue the submit unbind preventDefault
		}
	});
})