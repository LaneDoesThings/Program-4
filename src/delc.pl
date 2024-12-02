#!/usr/bin/perl -w

use File::Type;
use File::Path 'rmtree';

if (@ARGV)
{ 
    @file_list = @ARGV;
}
else
{ 
    print("ERROR: no args\n");
    exit 1;
}
foreach $file (@file_list)
{
    if(!-e $file)
    {
        print("ERROR: cannot find $file\n");
        exit 1;
    }
    $ft = File::Type->new();
    $file_type = $ft->mime_type($file);
    if(!$file_type)
    {
        $file_type_name = "directory";
    }
    else
    {
        $file_type_name = "file";
    }
    print("delete $file_type_name $file? [y,Q] ");
    $input = <STDIN>;

    if(lc($input) =~ "y")
    {
        push(@to_delete, $file);
    }
    else
    {
        last;
    }
}
print("About to delete:\n");
print(join(", ", @to_delete));
print ("\ncomplete all deletions? [y,N]: ");
$input = <STDIN>;
if(lc($input) =~ "y")
{
    foreach $file (@to_delete)
    {
        $file_type = $ft->mime_type($file);
        if(!$file_type)
        {
            rmtree($file);
        }
        else
        {
            unlink $file;
        }
    }
}
else
{
    print("Nothing has been deleted.\n");
    exit 0;
}
exit 0;