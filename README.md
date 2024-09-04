# opentelemetry-quickstart

## OpenTelemetry 


To build the container with OpenTelemetry configured
```shell script
podman build -f Containerfile -t opentelemetry-quickstart --no-cache .
```

To start the app container with OpenTelemetry configured
```shell script
podman run -ti --rm --name=app --network=host opentelemetry-quickstart
```

To start the opentelemetry grafana / backend container: 

```shell script
podman run -ti --rm --name=otelbackend -p 3000:3000 -p 4317:4317 -p 4318:4318 grafana/otel-lgtm  
```

Go to `http://localhost:3000` and click `Explore` in the navbar. In the `Metric` field you can select e.g. `system_cpu_load_average_15m`, press `Run query` at the top right and you'll see the collected metrics. 

## Links

* [opentelemetry.io/docs/](https://opentelemetry.io/docs/)
* [Adding software to a UBI container](https://docs.redhat.com/en/documentation/red_hat_enterprise_linux/8/html/building_running_and_managing_containers/assembly_adding-software-to-a-ubi-container_building-running-and-managing-containers)