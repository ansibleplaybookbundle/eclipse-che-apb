FROM ansibleplaybookbundle/apb-base:canary

LABEL "com.redhat.apb.spec"=\
"LS0tCnZlcnNpb246IDEuMApuYW1lOiBlY2xpcHNlLWNoZS1hcGIKZGVzY3JpcHRpb246IEVjbGlw\
c2UgQ2hlCmJpbmRhYmxlOiBmYWxzZQphc3luYzogb3B0aW9uYWwKbWV0YWRhdGE6CiAgcHJvdmlk\
ZXJEaXNwbGF5TmFtZTogIlJlZCBIYXQsIEluYy4iCiAgZG9jdW1lbnRhdGlvblVybDogImh0dHBz\
Oi8vd3d3LmVjbGlwc2Uub3JnL2NoZS9kb2NzLyIKICBpbWFnZVVybDogPi0KICAgIGh0dHBzOi8v\
Z2l0aHViLmNvbS9lY2xpcHNlL2NoZS1kb2NzL3Jhdy9tYXN0ZXIvc3JjL21haW4vaW1hZ2VzL2No\
ZV9sb2dvLnBuZwogIGxvbmdEZXNjcmlwdGlvbjogIkFuIEFQQiBkZXBsb3lzIEVjbGlwc2UgQ2hl\
IHY2Lnggd2l0aCBwZXJzaXN0ZW50IHN0b3JhZ2UuIgogIGRpc3BsYXlOYW1lOiAiRWNsaXBzZSBD\
aGUgKEFQQikiCiAgZGVwZW5kZW5jaWVzOgogICAgLSAiZG9ja2VyLmlvL2VjbGlwc2UvY2hlLXNl\
cnZlcjpuaWdodGx5IgogICAgLSAiZG9ja2VyLmlvL2pib3NzL2tleWNsb2FrLW9wZW5zaGlmdDoz\
LjQuMy5GaW5hbCIKICAgIC0gImRvY2tlci5pby9jZW50b3MvcG9zdGdyZXNxbC05Ni1jZW50b3M3\
OjkuNiIKcGxhbnM6CiAgLSBuYW1lOiBwcm9kCiAgICBkZXNjcmlwdGlvbjogUGVyc2lzdGVudCBk\
ZXBsb3ltZW50IG9mIEVjbGlwc2UgQ2hlCiAgICBmcmVlOiB0cnVlCiAgICBtZXRhZGF0YToKICAg\
ICAgZGlzcGxheU5hbWU6IFByb2R1Y3Rpb24KICAgICAgbG9uZ0Rlc2NyaXB0aW9uOiAiVGhpcyBw\
bGFuIGRlcGxveXMgRWNsaXBzZSBDaGUgd2l0aCBwZXJzaXN0ZW50IHN0b3JhZ2UuIgogICAgcGFy\
YW1ldGVyczoKICAgICAgLSBuYW1lOiAiY2hlX2ltYWdlX3RhZyIKICAgICAgICB0aXRsZTogQ2hl\
IFNlcnZlciBJbWFnZSBUYWcKICAgICAgICBkZXNjcmlwdGlvbjogTGF0ZXN0IGFsd2F5cyBwb2lu\
dHMgdG8gdGhlIGxhdGVzdCBzdGFibGUgdGFnLCBuaWdodGx5IGlzIHRoZSBtb3N0IHJlY2VudCBu\
aWdodGx5IGJ1aWxkCiAgICAgICAgdHlwZTogZW51bQogICAgICAgIGVudW06IFsibmlnaHRseSIs\
ICJsYXRlc3QiXQogICAgICAgIHJlcXVpcmVkOiBmYWxzZQogICAgICAgIGRlZmF1bHQ6ICJuaWdo\
dGx5IgogICAgICAgIGRpc3BsYXlfZ3JvdXA6IENoZSBDb25maWd1cmF0aW9uCiAgICAgIC0gbmFt\
ZTogImNoZV9zZWN1cmVfcm91dGVzIgogICAgICAgIHRpdGxlOiBIVFRQUyBTdXBwb3J0CiAgICAg\
ICAgZGVzY3JpcHRpb246IFVzZSBIVFRQUyBwcm90b2NvbCBmb3IgYWxsIGVuZHBvaW50cy4gUHJv\
dmlkZSBjZWxmIHNpZ25lZCBjZXJ0IGlmIGFwcGxpY2FibGUKICAgICAgICB0eXBlOiBib29sZWFu\
CiAgICAgICAgZGVmYXVsdDogZmFsc2UKICAgICAgICByZXF1aXJlZDogZmFsc2UKICAgICAgICBk\
aXNwbGF5X2dyb3VwOiBDaGUgQ29uZmlndXJhdGlvbgogICAgICAtIG5hbWU6ICJjaGVfc2VsZl9z\
aWduZWRfY2VydCIKICAgICAgICB0aXRsZTogU2VsZiBTaWduZWQgT3BlblNoaWZ0IFJvdXRlciBD\
ZXJ0aWZpY2F0ZQogICAgICAgIGRlc2NyaXB0aW9uOiBDb250ZW50IG9mIE9wZW5TaGlmdCByb3V0\
ZXIgcm9vdCBDQS4gU2hvdWxkIHN0YXJ0IHdpdGggLS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0t\
LiBPbmx5IGlmIHlvdSBoYXZlIHNlbGYgc2lnbmVkIENBCiAgICAgICAgdHlwZTogc3RyaW5nCiAg\
ICAgICAgZGlzcGxheV90eXBlOiB0ZXh0YXJlYQogICAgICAgIGRlZmF1bHQ6ICIiCiAgICAgICAg\
cmVxdWlyZWQ6IGZhbHNlCiAgICAgICAgZGlzcGxheV9ncm91cDogQ2hlIENvbmZpZ3VyYXRpb24K\
ICAgICAgLSBuYW1lOiAiY2hlX3NlcnZlcl9kZXBsb3ltZW50X3N0cmF0ZWd5IgogICAgICAgIHRp\
dGxlOiBDaGUgRGVwbG95bWVudCBTdHJhZ2V0eQogICAgICAgIHR5cGU6IGVudW0KICAgICAgICBl\
bnVtOiBbIlJlY3JlYXRlIiwgIlJvbGxpbmciXQogICAgICAgIHJlcXVpcmVkOiBmYWxzZQogICAg\
ICAgIGRlZmF1bHQ6ICJSZWNyZWF0ZSIKICAgICAgICBkaXNwbGF5X2dyb3VwOiBDaGUgQ29uZmln\
dXJhdGlvbgogICAgICAtIG5hbWU6ICJjaGVfc2VydmVyX2ltYWdlX3B1bGxfcG9saWN5IgogICAg\
ICAgIHRpdGxlOiAiQ2hlIERlcGxveW1lbnRDb25maWcgSW1hZ2UgcHVsbCBwb2xpY3kiCiAgICAg\
ICAgdHlwZTogZW51bQogICAgICAgIGVudW06IFsiQWx3YXlzIiwgIklmTm90UHJlc2VudCIsICJO\
ZXZlciJdCiAgICAgICAgcmVxdWlyZWQ6IGZhbHNlCiAgICAgICAgZGVmYXVsdDogIklmTm90UHJl\
c2VudCIKICAgICAgICBkaXNwbGF5X2dyb3VwOiBDaGUgQ29uZmlndXJhdGlvbgogICAgICAtIG5h\
bWU6ICJjaGVfcHJlZGVmaW5lZF9zdGFja3NfcmVsb2FkX19vbl9fc3RhcnQiCiAgICAgICAgdGl0\
bGU6ICJTdGFjayByZWxvYWQgb24gc3RhcnQiCiAgICAgICAgdHlwZTogYm9vbGVhbgogICAgICAg\
IGRlZmF1bHQ6IHRydWUKICAgICAgICByZXF1aXJlZDogZmFsc2UKICAgICAgICBkaXNwbGF5X2dy\
b3VwOiBDaGUgQ29uZmlndXJhdGlvbgogICAgICAtIG5hbWU6ICJjaGVfd29ya3NwYWNlX2F1dG9f\
c3RhcnQiCiAgICAgICAgdGl0bGU6ICJXb3Jrc3BhY2UgYXV0byBzdGFydCIKICAgICAgICB0eXBl\
OiBib29sZWFuCiAgICAgICAgZGVmYXVsdDogdHJ1ZQogICAgICAgIHJlcXVpcmVkOiBmYWxzZQog\
ICAgICAgIGRpc3BsYXlfZ3JvdXA6IENoZSBDb25maWd1cmF0aW9uCiAgICAgIC0gbmFtZTogImV4\
dGVybmFsX2tleWNsb2FrIgogICAgICAgIHRpdGxlOiAiQ29ubmVjdCB0byBFeHRlcm5hbCBLZXlj\
bG9hayIKICAgICAgICBkZXNjcmlwdGlvbjogV2hlbiBzZWxlY3RlZCwgcHJvdmlkZSBLZXljbG9h\
ayBVUkkgaW4gdGhlIGZpZWxkIGJlbG93LiBMZWF2ZSB1bmNoZWNrZWQgdG8gY3JlYXRlIGEgbmV3\
IEtleWNsb2FrIGRlcGxveW1lbnQKICAgICAgICB0eXBlOiBib29sZWFuCiAgICAgICAgZGVmYXVs\
dDogZmFsc2UKICAgICAgICByZXF1aXJlZDogZmFsc2UKICAgICAgICBkaXNwbGF5X2dyb3VwOiBL\
ZXljbG9hayBDb25maWd1cmF0aW9uCiAgICAgIC0gbmFtZTogImtleWNsb2FrX3VyaSIKICAgICAg\
ICB0aXRsZTogRXh0ZXJuYWwgS2V5Y2xvYWsgVVJJCiAgICAgICAgZGVzY3JpcHRpb246IExlYXZl\
IGJsYW5rIHN0YXJ0IGEgbmV3IEtleWNsb2FrIG9yIHByb3ZpZGUgVVJMIG9mIGFuIGV4aXN0aW5n\
IEtleWNsb2FrIGluc3RhbmNlLCBlLmcuIGh0dHBzOi8veW91ci1yaC1rZXljbG9hay11cmwKICAg\
ICAgICB0eXBlOiBzdHJpbmcKICAgICAgICByZXF1aXJlZDogZmFsc2UKICAgICAgICBkZWZhdWx0\
OiAiIgogICAgICAgIGRpc3BsYXlfZ3JvdXA6IEtleWNsb2FrIENvbmZpZ3VyYXRpb24KICAgICAg\
LSBuYW1lOiAia2V5Y2xvYWtfcHJvdmlzaW9uX3JlYWxtX3VzZXIiCiAgICAgICAgdGl0bGU6ICJQ\
cm92aXNpb24gcmVhbG0gYW5kIGFkbWluIHVzZXIiCiAgICAgICAgZGVzY3JpcHRpb246IFVuc2Vs\
ZWN0IG9ubHkgd2hlbiB1c2luZyBleGlzdGluZyByZWFsbSBhbmQgY2xpZW50IG9mIGFuIGV4dGVy\
bmFsIEtleWNsb2FrCiAgICAgICAgdHlwZTogYm9vbGVhbgogICAgICAgIGRlZmF1bHQ6IHRydWUK\
ICAgICAgICByZXF1aXJlZDogZmFsc2UKICAgICAgICBkaXNwbGF5X2dyb3VwOiBLZXljbG9hayBD\
b25maWd1cmF0aW9uCiAgICAgIC0gbmFtZTogImNoZV9rZXljbG9ha19hZG1pbl91c2VybmFtZSIK\
ICAgICAgICB0aXRsZTogS2V5Y2xvYWsgQWRtaW4gVXNlcm5hbWUKICAgICAgICB0eXBlOiBzdHJp\
bmcKICAgICAgICByZXF1aXJlZDogZmFsc2UKICAgICAgICBkZWZhdWx0OiAiYWRtaW4iCiAgICAg\
ICAgZGlzcGxheV9ncm91cDogS2V5Y2xvYWsgQ29uZmlndXJhdGlvbgogICAgICAtIG5hbWU6ICJj\
aGVfa2V5Y2xvYWtfYWRtaW5fcGFzc3dvcmQiCiAgICAgICAgdGl0bGU6IEtleWNsb2FrIEFkbWlu\
IFBhc3N3b3JkCiAgICAgICAgdHlwZTogc3RyaW5nCiAgICAgICAgcmVxdWlyZWQ6IGZhbHNlCiAg\
ICAgICAgZGVmYXVsdDogImFkbWluIgogICAgICAgIGRpc3BsYXlfdHlwZTogcGFzc3dvcmQKICAg\
ICAgICBkaXNwbGF5X2dyb3VwOiBLZXljbG9hayBDb25maWd1cmF0aW9uCiAgICAgIC0gbmFtZTog\
ImNoZV9rZXljbG9ha19yZWFsbSIKICAgICAgICB0aXRsZTogQ2hlIEtleWNsb2FrIFJlYWxtCiAg\
ICAgICAgdHlwZTogc3RyaW5nCiAgICAgICAgZGVmYXVsdDogImNoZSIKICAgICAgICByZXF1aXJl\
ZDogZmFsc2UKICAgICAgICBkaXNwbGF5X2dyb3VwOiBLZXljbG9hayBDb25maWd1cmF0aW9uCiAg\
ICAgIC0gbmFtZTogImNoZV9rZXljbG9ha19jbGllbnRfX2lkIgogICAgICAgIHRpdGxlOiAiQ2hl\
IEtleWNsb2FrIENsaWVudCBJZCIKICAgICAgICB0eXBlOiBzdHJpbmcKICAgICAgICBkZWZhdWx0\
OiAiY2hlLXB1YmxpYyIKICAgICAgICByZXF1aXJlZDogZmFsc2UKICAgICAgICBkaXNwbGF5X2dy\
b3VwOiBLZXljbG9hayBDb25maWd1cmF0aW9uCiAgICAgIC0gbmFtZTogImNoZV9leHRlcm5hbF9k\
YiIKICAgICAgICB0aXRsZTogIkNvbm5lY3QgdG8gRXh0ZXJuYWwgUG9zdGdyZXMgRGF0YWJhc2Ui\
CiAgICAgICAgZGVzY3JpcHRpb246IENoZWNrIHRvIGNvbm5lY3QgdG8gZXhpc3RpbmcgZXh0ZXJu\
YWwgZGF0YWJhc2UuIFByb3ZpZGUgZXh0ZXJuYWwgaG9zdCwgcG9ydCwgdXNlciwgcGFzc3dvcmQg\
YW5kIGRhdGFiYXNlIGluIHRoZSBmaWVsZHMgYmVsb3cuCiAgICAgICAgdHlwZTogYm9vbGVhbgog\
ICAgICAgIGRlZmF1bHQ6IGZhbHNlCiAgICAgICAgcmVxdWlyZWQ6IGZhbHNlCiAgICAgICAgZGlz\
cGxheV9ncm91cDogUG9zdGdyZVNRTCBEYXRhYmFzZSBDb25maWd1cmF0aW9uCiAgICAgIC0gbmFt\
ZTogImNoZV9qZGJjX2RiX2hvc3QiCiAgICAgICAgdGl0bGU6IERhdGFiYXNlIGhvc3QKICAgICAg\
ICB0eXBlOiBzdHJpbmcKICAgICAgICByZXF1aXJlZDogZmFsc2UKICAgICAgICBkZWZhdWx0OiAi\
cG9zdGdyZXMiCiAgICAgICAgZGlzcGxheV9ncm91cDogUG9zdGdyZVNRTCBEYXRhYmFzZSBDb25m\
aWd1cmF0aW9uCiAgICAgIC0gbmFtZTogImNoZV9qZGJjX2RiX3BvcnQiCiAgICAgICAgdGl0bGU6\
IERhdGFiYXNlIHBvcnQKICAgICAgICB0eXBlOiBzdHJpbmcKICAgICAgICByZXF1aXJlZDogZmFs\
c2UKICAgICAgICBkZWZhdWx0OiAiNTQzMiIKICAgICAgICBkaXNwbGF5X2dyb3VwOiBQb3N0Z3Jl\
U1FMIERhdGFiYXNlIENvbmZpZ3VyYXRpb24KICAgICAgLSBuYW1lOiAiY2hlX2pkYmNfZGJfbmFt\
ZSIKICAgICAgICB0aXRsZTogRGF0YWJhc2UgbmFtZQogICAgICAgIHR5cGU6IHN0cmluZwogICAg\
ICAgIHJlcXVpcmVkOiBmYWxzZQogICAgICAgIGRlZmF1bHQ6ICJkYmNoZSIKICAgICAgICBkaXNw\
bGF5X2dyb3VwOiBQb3N0Z3JlU1FMIERhdGFiYXNlIENvbmZpZ3VyYXRpb24KICAgICAgLSBuYW1l\
OiAiY2hlX2pkYmNfdXNlcm5hbWUiCiAgICAgICAgdGl0bGU6IERhdGFiYXNlIHVzZXJuYW1lCiAg\
ICAgICAgdHlwZTogc3RyaW5nCiAgICAgICAgcmVxdWlyZWQ6IGZhbHNlCiAgICAgICAgZGVmYXVs\
dDogInBnY2hlIgogICAgICAgIGRpc3BsYXlfZ3JvdXA6IFBvc3RncmVTUUwgRGF0YWJhc2UgQ29u\
ZmlndXJhdGlvbgogICAgICAtIG5hbWU6ICJjaGVfamRiY19wYXNzd29yZCIKICAgICAgICB0aXRs\
ZTogRGF0YWJhc2UgcGFzc3dvcmQgKHNldCB0byBkZWZhdWx0IHBnY2hlcGFzc3dvcmQpCiAgICAg\
ICAgdHlwZTogc3RyaW5nCiAgICAgICAgcmVxdWlyZWQ6IGZhbHNlCiAgICAgICAgZGVmYXVsdDog\
InBnY2hlcGFzc3dvcmQiCiAgICAgICAgZGlzcGxheV90eXBlOiBwYXNzd29yZAogICAgICAgIGRp\
c3BsYXlfZ3JvdXA6IFBvc3RncmVTUUwgRGF0YWJhc2UgQ29uZmlndXJhdGlvbgogICAgICAtIG5h\
bWU6ICJjaGVfZGF0YV9wdmNfcXVhbnRpdHkiCiAgICAgICAgdGl0bGU6ICJDaGUgc2VydmVyIGRh\
dGEgdm9sdW1lIHNpemUiCiAgICAgICAgdHlwZTogc3RyaW5nCiAgICAgICAgcmVxdWlyZWQ6IGZh\
bHNlCiAgICAgICAgZGVmYXVsdDogIjFHaSIKICAgICAgICBkaXNwbGF5X2dyb3VwOiBQZXJzaXN0\
ZW50IFZvbHVtZQogICAgICAtIG5hbWU6ICJjaGVfaW5mcmFfa3ViZXJuZXRlc19wdmNfcHJlY3Jl\
YXRlX19zdWJwYXRocyIKICAgICAgICB0aXRsZTogUHJlY3JlYXRlIFN1YnBhdGhzCiAgICAgICAg\
dHlwZTogYm9vbGVhbgogICAgICAgIHJlcXVpcmVkOiBmYWxzZQogICAgICAgIGRlZmF1bHQ6IHRy\
dWUKICAgICAgICBkaXNwbGF5X2dyb3VwOiBQZXJzaXN0ZW50IFZvbHVtZQogICAgICAtIG5hbWU6\
ICJjaGVfaW5mcmFfa3ViZXJuZXRlc19wdmNfcXVhbnRpdHkiCiAgICAgICAgdGl0bGU6IERpc2sg\
cXVhbnRpdHkgZm9yIGNoZSB3b3Jrc3BhY2UKICAgICAgICB0eXBlOiBzdHJpbmcKICAgICAgICBy\
ZXF1aXJlZDogZmFsc2UKICAgICAgICBkZWZhdWx0OiAiMUdpIgogICAgICAgIGRpc3BsYXlfZ3Jv\
dXA6IFBlcnNpc3RlbnQgVm9sdW1lCiAgICAgIC0gbmFtZTogImNoZV9pbmZyYV9rdWJlcm5ldGVz\
X3B2Y19zdHJhdGVneSIKICAgICAgICB0aXRsZTogQ29tbW9uIG9yIHVuaXF1ZSB2b2x1bWUgZm9y\
IHdvcmtzcGFjZQogICAgICAgIHR5cGU6IGVudW0KICAgICAgICBlbnVtOiBbJ3VuaXF1ZScsICdj\
b21tb24nXQogICAgICAgIHJlcXVpcmVkOiBmYWxzZQogICAgICAgIGRlZmF1bHQ6ICJ1bmlxdWUi\
CiAgICAgICAgZGlzcGxheV9ncm91cDogUGVyc2lzdGVudCBWb2x1bWUKICAgICAgLSBuYW1lOiAi\
Y2hlX2luZnJhX2t1YmVybmV0ZXNfcHZjX25hbWUiCiAgICAgICAgdGl0bGU6IFdvcmtzcGFjZSBW\
b2x1bWUgTmFtZSAob25seSBpZiBzdHJhdGVneSBpcyBjb21tb24pCiAgICAgICAgdHlwZTogc3Ry\
aW5nCiAgICAgICAgcmVxdWlyZWQ6IGZhbHNlCiAgICAgICAgZGVmYXVsdDogIiIKICAgICAgICBk\
aXNwbGF5X2dyb3VwOiBQZXJzaXN0ZW50IFZvbHVtZQogICAgICAtIG5hbWU6ICJjaGVfZGVidWdf\
c2VydmVyIgogICAgICAgIHRpdGxlOiBFbmFibGUgQ2hlIERlYnVnZ2luZwogICAgICAgIHR5cGU6\
IGJvb2xlYW4KICAgICAgICByZXF1aXJlZDogZmFsc2UKICAgICAgICBkZWZhdWx0OiBmYWxzZQog\
ICAgICAgIGRpc3BsYXlfZ3JvdXA6IERlYnVnCiAgICAgIC0gbmFtZTogImNoZV9sb2dfbGV2ZWwi\
CiAgICAgICAgdGl0bGU6ICJDaGUgTG9nIExldmVsIgogICAgICAgIHR5cGU6IHN0cmluZwogICAg\
ICAgIHJlcXVpcmVkOiBmYWxzZQogICAgICAgIGRlZmF1bHQ6ICJJTkZPIgogICAgICAgIGRpc3Bs\
YXlfZ3JvdXA6IERlYnVnCg=="


COPY playbooks /opt/apb/actions
COPY roles /opt/ansible/roles
RUN chmod -R g=u /opt/{ansible,apb} && \
    find /opt/ansible/roles/keycloak-apb -type f | xargs sed -i "s/'persistent'/'prod'/g" && \
    find /opt/ansible/roles/keycloak-apb -type f | xargs sed -i "s/'ephemeral'/'dev'/g"

USER root
RUN yum install dmidecode -y

USER apb

