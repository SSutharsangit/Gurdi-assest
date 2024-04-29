class Service {
  final int providerId;
  final int serviceId;
  final int amountPerHour;
  final String serviceName;
  final String serviceDescription;
  final String providerName;
  final String serviceTypeName;
  final double rating;
  final String feedback;

  Service({
    required this.providerId,
    required this.serviceId,
    required this.amountPerHour,
    required this.serviceName,
    required this.serviceDescription,
    required this.providerName,
    required this.serviceTypeName,
    required this.rating,
    required this.feedback,
  });

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      providerId: json['provider_id'],
      serviceId: json['service_id'],
      amountPerHour: json['amount_per_hour'],
      serviceName: json['service_name'],
      serviceDescription: json['service_description'],
      providerName: json['provider_name'],
      serviceTypeName: json['service_type_name'],
      rating: json['rating'].toDouble(),
      feedback: json['feedback'],
    );
  }
}
