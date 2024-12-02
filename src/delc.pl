#!/usr/bin/perl -w


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
    print("delete $file? [y,Q] ");
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
#DO THE STUFF HERE
exit 0;