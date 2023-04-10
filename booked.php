 <section id="bg-bus" class="d-flex align-items-center">
<main id="main">
	<div class="container-fluid">
		<div class="col-lg-12">
			<?php  if(isset($_SESSION['login_id'])): ?>
			<div class="row">
				<div class="col-md-12">
					
				</div>
			</div>
		<?php endif; ?>
			<div class="row">
				&nbsp;
			</div>
			<div class="row">
				<div class="card col-md-12">
					
					<div class="card-body">
						<table class="table table-striped table-bordered" id="booked-field">
							
							<thead>
								<tr>
									<th class="text-center">No.</th>
									<th class="text-center">Ref. No.</th>
									<th class="text-center">Name</th>
									<th class="text-center">Address</th>
									<th class="text-center">Phone</th>
									<th class="text-center">Comfirm From</th>
									<th class="text-center">Comfirm To</th>
									<th class="text-center">Quantity</th>
									<th class="text-center">Amount</th>
									<th class="text-center">Status</th>
									<th class="text-center">Action</th>
								</tr>
							</thead>
							<tbody>
								
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		
	</div>
</main>
</section>
<script>
	$('#new_schedule').click(function(){
		uni_modal('Add New Schedule','manage_schedule.php')
	})
	window.load_booked = function(){
		$('#booked-field').dataTable().fnDestroy();
		$('#booked-field tbody').html('<tr><td colspan="7" class="text-center">Please wait...</td></tr>')
		$.ajax({
			url:'load_booked.php',
			error:err=>{
				console.log(err)
				alert_toast('An error occured.','danger');
			},
			success:function(resp){
				if(resp){
					if(typeof(resp) != undefined){
						resp = JSON.parse(resp)
							if(Object.keys(resp).length > 0){
								$('#booked-field tbody').html('')
								var i = 1 ;
								Object.keys(resp).map(k=>{
									var tr = $('<tr></tr>');
									tr.append('<td class="text-center">'+(i++)+'</td>')
									tr.append('<td class="">'+resp[k].ref_no+'</td>')
									tr.append('<td class="">'+resp[k].name+'</td>')
									tr.append('<td class="">'+resp[k].address+'</td>')
									tr.append('<td class="">'+resp[k].phone+'</td>')
									tr.append('<td class="">'+resp[k].confirm_from+'</td>')
									tr.append('<td class="">'+resp[k].confirm_to+'</td>')
									tr.append('<td class="">'+resp[k].qty+'</td>')
									tr.append('<td class="">'+resp[k].amount+'</td>')
									tr.append('<td class="">'+(resp[k].status == 1 ? 'Paid' :'Unpaid')+'</td>')
									
										tr.append('<td><center><button class="btn btn-sm btn-primary mr-2 text-white edit_booked" data-id="'+resp[k].schedule_id+'" data-bid="'+resp[k].id+'"><strong>Edit</strong></button><button class="btn btn-sm btn-danger remove_booked" data-id="'+resp[k].id+'">Delete</button></center></td>')
									$('#booked-field tbody').append(tr)

								})

							}else{
								$('#booked-field tbody').html('<tr><td colspan="7" class="text-center">No data.</td></tr>')
							}
					}
				}
			},
			complete:function(){
				$('#booked-field').dataTable()
				$('.edit_booked').click(function(){
					uni_modal('Edit Booked','customer_book.php?id='+$(this).attr('data-id')+'&bid='+$(this).attr('data-bid'),1)
				})
				
				$('.remove_booked').click(function(){
		_conf('Are you sure to delete this data?','remove_booked',[$(this).attr('data-id')])

		})
			}

		})
	}

	function remove_booked($id=''){
		start_load()
		$.ajax({
			url:'delete_booked.php',
			method:'POST',
			data:{id:$id},
			error:err=>{
				console.log(err)
				alert_toast("An error occured","danger");
				end_load()
			},
			success:function(resp){
				if(resp== 1){
					alert_toast("Data succesfully deleted","success");
					end_load()
					$('.modal').modal('hide')
					load_booked()
				}
			}
		})
	}

	
	$(document).ready(function(){
		load_booked()
	})
</script>