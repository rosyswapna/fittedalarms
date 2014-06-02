<?php
/*********************************************************************************
 * The content of this file is subject to the EMAIL Maker license.
 * ("License"); You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is IT-Solutions4You s.r.o.
 * Portions created by IT-Solutions4You s.r.o. are Copyright(C) IT-Solutions4You s.r.o.
 * All Rights Reserved.
 ********************************************************************************/
 
$source_path=getcwd()."/modules/EMAILMaker/torewrite";
$dir_iterator = new RecursiveDirectoryIterator($source_path);
$iterator = new RecursiveIteratorIterator($dir_iterator, RecursiveIteratorIterator::SELF_FIRST);

$i = 0;
$p_errors = 0;

foreach ($iterator as $file) 
{
    $dest=substr($file, strlen($source_path)+1);

    if($file->isFile())
    { 
      if (!vtlib_isWriteable($dest))
      {
				  $permission = "<font color='red'>".$mod_strings["LBL_CHANGE_PERMISSION"]."</font>";
			    $p_errors++;
      }
      else
			    $permission = "<font color='green'>OK</font>";
      
      if (substr($dest, 0, 8) == "modules/")
         $s = $i + 10000;
      elseif (substr($dest, 0, 7) == "Smarty/")
         $s = $i + 20000;
      else
         $s = $i;
      
      $SeqLines[] = $s;
      $Lines[$s] = "- ".$dest." ".$permission."<br>";
    }
   
    $i++;         
}
sort($SeqLines);

$list_permissions = "<b>";
foreach ($SeqLines AS $s)
{
    $list_permissions .= $Lines[$s];
}
$list_permissions .= "</b>";

$list_permissions .= "<input type='hidden' id='bad_files' value='".$p_errors."'>";


if (isset($_REQUEST["action"]) && $_REQUEST["action"] == "EMAILMakerAjax") echo $list_permissions; 
?>
