from dagster import Definitions, EnvVar

from analytics.assets.airbyte.airbyte import airbyte_assets
from analytics.assets.airbyte.airbyte import airbyte_assets
from analytics.assets.dbt.dbt import dbt_warehouse, dbt_warehouse_resource

defs = Definitions(
    assets=[airbyte_assets, dbt_warehouse],
    resources={
        "dbt_warehouse_resource": dbt_warehouse_resource
    }
)
