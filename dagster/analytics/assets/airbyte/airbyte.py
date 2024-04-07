from dagster import EnvVar, AutoMaterializePolicy, FreshnessPolicy
from dagster_airbyte import AirbyteResource, load_assets_from_airbyte_instance

airbyte_resource = AirbyteResource(
    host=EnvVar("airbyte_host"),
    port="8000",
    username="airbyte",
    password=EnvVar("airbyte_password"),

)

airbyte_assets = load_assets_from_airbyte_instance(
    airbyte_resource,
    key_prefix="northwind",
    connection_filter=lambda meta: "3" in meta.name, #filters connections to not grab duplicate connection

    )

