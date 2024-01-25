import sqlalchemy as sa
import pandas as pd

from sqlalchemy import create_engine
from pathlib import Path

folder_path = Path('01-docker-terraform/2_docker_sql/')

taxi_data = 'green_tripdata_2019-09.csv'
zone_data = 'taxi+_zone_lookup.csv'

taxi_db_name = 'green_taxi_data'
zone_db_name = 'taxi_zones'

taxi_file_path = folder_path / taxi_data
zone_file_path = folder_path / zone_data

connection = sa.create_engine('postgresql://root:root@localhost:5432/ny_taxi')

chunked = pd.read_csv(taxi_file_path, chunksize=100000)
for chunk in chunked:
    chunk.to_sql(name=taxi_db_name, con=connection, if_exists='append')
    print('inserted some rows...')

print('all done.')

chunked = pd.read_csv(zone_file_path, chunksize=100000)
for chunk in chunked:
    chunk.to_sql(name=zone_db_name, con=connection, if_exists='append')
    print('inserted some rows...')

print('all done.')