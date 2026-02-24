grep -rhoE '[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}' /etc 2>/dev/null \
| sort -u \
| paste -sd "," - \
> emails.lst
