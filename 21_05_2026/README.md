# In this section i learned about External DNS.

# ExternalDNS is a Kubernetes controller that automatically manages DNS records for your cluster's services and ingresses. It acts as a bridge between Kubernetes resources and DNS providers like AWS Route 53, ensuring your DNS records stay synchronized with your cluster's state. Using DNS entries for your load balancers provides human-readable, memorable addresses instead of auto-generated host names, making your services easily accessible and recognizable as your corporate resources with domain names that align with your organization's branding.

# In this section, i also learned about enabling automatic DNS record management for RetailStore app running on EKS using ExternalDNS with AWS Route 53.

# Using ExternalDNS, EKS cluster will auto-create and auto-update DNS records in Route53 based on Kubernetes Ingress annotations.

# Note:- To avoid additional domain costs, i did not create a domain in the Route 53 service. Therefore, i only watched the course videos for this section and did not perform the practical exercises. The same was suggested by Pradyumna to everyone.