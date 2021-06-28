# smhi-influxdb-exporter
Fetch latest temperature from SMHI API and push it to influxdb.

## Setup
Build and run docker image
`docker build -t smhi-influxdb-exporter:latest .`
`docker run -e <SEE_TABLE_BELOW> smhi-influxdb-exporter:latest` 

| Variable         | Mandatory | Description                        |
| ---------------- |:---------:| ---------------------------------- |
| LONGITUDE        | Yes       | Longitude position                 |
| LATITUDE         | Yes       | Latitude position                  |
| INFLUX_USER      | Yes       | Influxdb username                  |
| INFLUX_PASS      | Yes       | Influxdb password                  |
| HOSTNAME         | Yes       | Hostname or IP address to influxdb |
| PORT             | Yes       | Port used by influxdb              |
| DATABASE         | Yes       | Influxdb database name             |
| RETENTION_POLICY | No        | Influxdb retention policy to use   |

