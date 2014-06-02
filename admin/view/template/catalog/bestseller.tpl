<?php echo $header; ?>
<div id="content">

	<div class="breadcrumb">
		<?php foreach ($breadcrumbs as $breadcrumb) { ?>
		<?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
		<?php } ?>
	</div>

	<?php if ($error_warning) { ?>
	 <div class="warning"><?php echo $error_warning; ?></div>
	<?php } ?>

	 <?php if ($success) { ?>
	 <div class="success"><?php echo $success; ?></div>
	 <?php } ?>

	 <div class="box">

		<div class="heading">
			<h1><?php echo $heading_title; ?></h1>
			<div class="buttons">
				<a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a>
				<a href="<?php echo $cancel; ?>" class="button"><?php echo $button_cancel; ?></a>
			</div>
	    </div>

	    <div class="content">
	    	<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
	    		<table class="form">
		          	<tr>
                   		<td>
                   			<span><?php echo $text_bestseller;?></span><br/>

                   			<select multiple="multiple" style="width:300px;height:100px;" name="lstproduct[]" id="lstproduct">
                   				<?php foreach ($products as $product) { ?>
                   				<option value="<?php echo $product['product_id']; ?>"><?php echo $product['name']; ?></option>
                   				<?php } ?>
                   			</select>

	                   		
              			</td>
              			<td width="20">
              				<p><img src="view/image/add.png" alt=""  id="button-add" /></p>
              				<p><img src="view/image/delete.png" alt="" id="button-remove" /></p>
              			</td>

              			<td>
                   			<span><?php echo $text_bestseller_layout;?></span><br/>
                   			<select multiple="multiple" style="width:300px;height:100px;" name="lstbestseller[]" id="lstbestseller">
                   				<?php foreach ($bestsellers as $bestseller) { ?>
                   				<option value="<?php echo $bestseller['product_id']; ?>"><?php echo $bestseller['name']; ?></option>
                   				<?php } ?>
                   			</select>


              				
              			</td>
          			</tr>
		        </table>
	    	</form>

	    	<?php if(isset($bestseller_list)){?>

	    	<table id="module" class="list">
          		<thead>
		            <tr>
		              <td class="left">Product Name</td>
		              <td class="left">Sort Order</td>
		              
		            </tr>
          		</thead>

          		<tbody>
          			<?php foreach ($bestseller_list as $bestseller) { ?>
          			<tr>
          				<td class="left"><?php echo $bestseller['name'];?></td>
		              	<td class="left"><?php echo $bestseller['bestseller_order'];?> </td>
          			</tr>
          			<?php } ?>
          		</tbody>

          	</table>

          	<?php }?>

	    </div>

	</div>


</div>

<script type="text/javascript"><!--

//add option ti user pages
	$("#button-add").click(function(){

		$( "#lstproduct option:selected" ).each(function() {
			$('<option>').val($(this).val()).text($(this).text()).appendTo('#lstbestseller');
			$("#lstproduct option[value='"+$(this).val()+"']").remove();
		});

		
	});

	//remove options from user pages
	$("#button-remove").click(function(){
		$( "#lstbestseller option:selected" ).each(function() {
			$('<option>').val($(this).val()).text($(this).text()).appendTo('#lstproduct');
			$("#lstbestseller option[value='"+$(this).val()+"']").remove();

		});

	});

	//select all user pages
	$("#form").submit(function(){
		$('#lstbestseller option').attr('selected',true);
	});

//--></script>


<?php echo $footer; ?>