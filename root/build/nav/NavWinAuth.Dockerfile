ARG NAV_VERSION
FROM navinstalled:$NAV_VERSION

LABEL maintainer "Jakub Vanak, Tobias Fenster"

RUN powershell Remove-Item -Recurse -Force 'C:\install\content\DynamicsNavDvd'

CMD powershell c:\install\content\Scripts\Run-NavService-Win.ps1 \
    -SERVERINSTANCE %nav_instance% \
    -DBSERVER %sql_server% \
    -DBNAME %sql_db% \
    -IMPORTCRONUSLIC %import_cronus_license% \
    -RECONFIGUREEXISTINGINSTANCE %config_instance%
