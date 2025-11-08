from locust import HttpUser, task, LoadTestShape


PRODUCT_URL = "/product/dkp-16942497/"
TASK_WEIGHT = 2

class DigiKalaUser(HttpUser):
    wait_time = lambda self: 1 

    @task(TASK_WEIGHT)
    def view_product(self):
        self.client.get(PRODUCT_URL)


class SpikeShape(LoadTestShape):
    stages = [   
        {"duration": 60, "users": 500, "spawn_rate": 100},  
        {"duration": 120, "users": 50, "spawn_rate": 20}, 
        {"duration": 240, "users": 1000, "spawn_rate": 200},   
    ]

    def tick(self):
        run_time = self.get_run_time()
        for stage in self.stages:
            if run_time < stage["duration"]:
                return (stage["users"], stage["spawn_rate"])
            run_time -= stage["duration"]
        return None
