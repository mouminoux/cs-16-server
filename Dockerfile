FROM moum/cs-16:latest

# Runtime settings
ENV RCON_PASSWORD="mirakl"
ENV SV_PASSWORD=""
ENV MAXPLAYERS="32"
ENV MAPNAME="fy_pool_day"

# Copy the files
COPY --chown=steam:steam cstrike/maps cstrike_downloads/maps
COPY --chown=steam:steam cstrike/addons cstrike/addons
COPY --chown=steam:steam cstrike/cfgs cstrike/cfgs
COPY --chown=steam:steam cstrike/liblist.gam cstrike/mapcycle.txt \
  cstrike/server.cfg cstrike/motd.html cstrike/
