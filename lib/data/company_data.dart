/// Static content mirrors the copy published on the Pabeda Ship
/// Construction Company website (pabedashipconstruction.vercel.app).
library;

class ServiceInfo {
  final String title;
  final String description;
  final String image;
  final String icon;

  const ServiceInfo({
    required this.title,
    required this.description,
    required this.image,
    required this.icon,
  });
}

class TeamMember {
  final String name;
  final String role;
  final String image;

  const TeamMember({required this.name, required this.role, required this.image});
}

class FeatureInfo {
  final String title;
  final String description;
  final String icon;

  const FeatureInfo({required this.title, required this.description, required this.icon});
}

class OfficeInfo {
  final String label;
  final String address;

  const OfficeInfo({required this.label, required this.address});
}

class CompanyData {
  CompanyData._();

  static const name = 'Pabeda Ship Construction Company Limited';
  static const tagline =
      'At Pabeda, we specialize in the art and science of ship building, merging '
      'traditional craftsmanship with cutting-edge technology to create vessels '
      'that stand the test of time.';
  static const foundedYear = '2010';
  static const aboutHeading = 'Innovative Shipbuilding and Marine Engineering';
  static const aboutBody =
      'Our shipyard is committed to excellence in naval architecture and marine '
      'engineering. We design and construct ships that meet the highest '
      'standards of quality and performance, ensuring durability and '
      'reliability in every vessel we build.';

  static const List<String> heroImages = [
    'assets/images/carousel-1.jpg',
    'assets/images/carousel-2.jpg',
  ];

  static const services = <ServiceInfo>[
    ServiceInfo(
      title: 'Designs and Redesigns',
      description:
          'Expert designs and redesigns to ensure the stability, safety, and '
          'performance of your vessel, meeting all standards and expectations.',
      image: 'assets/images/service-1.jpg',
      icon: 'design',
    ),
    ServiceInfo(
      title: "Ships' Plan Works",
      description:
          'Comprehensive plan works for ships to ensure efficient and '
          'effective vessel layouts and configurations.',
      image: 'assets/images/service-2.jpg',
      icon: 'plan',
    ),
    ServiceInfo(
      title: 'Consultancy',
      description:
          'Professional consultancy services to provide expert advice and '
          'guidance on all aspects of ship construction and operations.',
      image: 'assets/images/service-3.jpg',
      icon: 'consult',
    ),
    ServiceInfo(
      title: 'Constructions and Reconstructions',
      description:
          'High-quality constructions and reconstructions of various types of '
          'vessels, ensuring durability and performance.',
      image: 'assets/images/service-4.jpg',
      icon: 'build',
    ),
    ServiceInfo(
      title: 'Acquisitions',
      description:
          'Expert services in the acquisition of vessels, ensuring the best '
          'quality and value for our clients.',
      image: 'assets/images/service-5.jpg',
      icon: 'acquire',
    ),
    ServiceInfo(
      title: 'Repairs',
      description:
          'Comprehensive repair services to maintain and restore the '
          'functionality and performance of your vessel.',
      image: 'assets/images/about.jpg',
      icon: 'repair',
    ),
  ];

  static const features = <FeatureInfo>[
    FeatureInfo(
      title: 'Innovative Design',
      description:
          'Our ships are designed with the latest technology to ensure '
          'efficiency, safety, and durability.',
      icon: 'innovative',
    ),
    FeatureInfo(
      title: 'Quality Construction',
      description:
          'We use the highest quality materials and construction techniques '
          'to build robust and reliable ships.',
      icon: 'quality',
    ),
    FeatureInfo(
      title: 'Comprehensive Support',
      description:
          'Our team provides ongoing support and maintenance to ensure your '
          'ships remain in top condition.',
      icon: 'support',
    ),
  ];

  static const values = <FeatureInfo>[
    FeatureInfo(
      title: 'Global Standards',
      description:
          'We adhere to international maritime regulations and standards, '
          'ensuring every vessel we construct is built to last and perform.',
      icon: 'globe',
    ),
    FeatureInfo(
      title: 'Timely Completion',
      description:
          'Our experienced team ensures every project is completed on time '
          'without compromising on quality, meeting the expectations of our '
          'clients.',
      icon: 'clock',
    ),
  ];

  static const team = <TeamMember>[
    TeamMember(
      name: 'Professor Victor Cizor',
      role: 'Chairman / Executive Director',
      image: 'assets/images/team-3.jpg',
    ),
    TeamMember(
      name: 'Captain Lekan Olopade',
      role: 'Managing Director / C.E.O',
      image: 'assets/images/ceo.jpg',
    ),
    TeamMember(
      name: 'Engr. Vladimir K. Kulik',
      role: 'Executive Director',
      image: 'assets/images/team-3.jpg',
    ),
  ];

  static const offices = <OfficeInfo>[
    OfficeInfo(
      label: 'Lagos Office',
      address:
          'Plot 452, Flat 1, Amuwo Odofin Housing Estate, Mile 2, Lagos, Nigeria.',
    ),
    OfficeInfo(
      label: 'London Office',
      address:
          '6 Glenbuck Court, Glenbuck Road, Surbiton, London, KT6 6BY, UK.',
    ),
  ];

  static const phoneNumbers = <String>[
    '+234 8034107891',
    '+234 8053936292',
    '+44 7405975140',
  ];

  static const email = 'pabedashipconstructioncompany@gmail.com';
}
