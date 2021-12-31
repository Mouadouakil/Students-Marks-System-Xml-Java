<grps>
{
for $x in doc("Students_GINF2.xml")/Students/Student
return if ($x/ID <= 24)
then <grp1>{data($x/LastName), data($x/FirstName) }</grp1>
else <grp2>{data($x/LastName) , data($x/FirstName) }</grp2>

 }
</grps>