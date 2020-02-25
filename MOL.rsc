:global AtualUsers value=[/user active find];
:global OldUsers value=[/user active find];
:global contador value=0;


:global myFunc do={
    :global AtualUsers;
    :put $AtualUsers;
    :global OldUsers;
    :put $OldUsers;
    :global var1 value=[:len $AtualUsers];
    :global var2 value=[:len $OldUsers];
    :if (var1 > var2) do={
        :local tmpAllTheUsersLogged value=[/user active find];
        :local tmpMessage value="";
        :foreach tmpArrayItem in=$tmpAllTheUsersLogged do={
            :set $tmpMessage value=($tmpMessage.[/user active get value-name=name $tmpArrayItem]." horario ".[/user active get value-name=when $tmpArrayItem]." utilizando ".[/user active get value-name=via $tmpArrayItem]." ip/mac ".[/user active get value-name=address $tmpArrayItem]."\r\n");
        };
        :set $tmpMessage value=("Usuarios logados(s) ".[/system clock get date]." ".[/system clock get time]."\r\n".$tmpMessage);
        /tool e-mail send to="DESTINATION_EMAIL" subject=("usuario(s) logados data/hora ".[/system clock get date]." ".[/system clock get time]." mikrotik ".[/system identity get name]) body=$tmpMessage;

    }
}

    :while ($contador < 7) do={
        :set $AtualUsers [/user active find];
        $myFunc
        :set $OldUsers [/user active find];
        :delay 2s;
}
