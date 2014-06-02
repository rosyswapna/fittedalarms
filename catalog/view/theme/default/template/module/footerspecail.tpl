<div >
<table width="100%" >
  <tr>
	<?php if($left) { ?>
   <td valign="top" align="left"  width="33%" >
	 <?php echo $left; ?>
   </td>
<?php } ?>
	
<?php if($center) { ?>
<td valign="top" align="center">
<?php echo $center; ?>
</td>
<?php } ?>

<?php if($right) { ?>
<td valign="top" align="right" width="33%" >
<?php echo $right; ?>
</td>
<?php } ?>
	
  </tr>
</table>
</div>
