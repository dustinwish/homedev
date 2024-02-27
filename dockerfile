version: '3'

services:
  erpnext_instance_1:
    image: frappe/erpnext-worker:${APP_VERSION}
    container_name: erpnext_instance_1
    environment:
      - "SITE_NAME=ripple.local"
      - "MYSQL_HOST=10.0.0.66"
    volumes:
      - erpnext_instance_1_assets:/home/frappe/frappe-bench/sites/site1.local/assets
      - erpnext_instance_1_sites:/home/frappe/frappe-bench/sites/site1.local/site1.local
    ports:
      - "8000:8000"
    networks:
      erpnext_network:
        ipv4_address: 10.0.0.66

  erpnext_instance_2:
    image: frappe/erpnext-worker:${APP_VERSION}
    container_name: erpnext_instance_2
    environment:
      - "SITE_NAME=resilient.local"
      - "MYSQL_HOST=10.0.0.67"
    volumes:
      - erpnext_instance_2_assets:/home/frappe/frappe-bench/sites/site2.local/assets
      - erpnext_instance_2_sites:/home/frappe/frappe-bench/sites/site2.local/site2.local
    ports:
      - "8001:8000"
    networks:
      erpnext_network:
        ipv4_address: 10.0.0.67

networks:
  erpnext_network:
    ipam:
      driver: default
      config:
        - subnet: 10.0.0.0/24

volumes:
  erpnext_instance_1_assets:
  erpnext_instance_1_sites:
  erpnext_instance_2_assets:
  erpnext_instance_2_sites:
