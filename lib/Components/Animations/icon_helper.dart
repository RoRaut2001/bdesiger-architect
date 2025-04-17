// lib/helpers/tech_icons.dart
import 'package:flutter/material.dart';

class TechStackIcons {
  // Map technology slugs to their corresponding IconData
  static final Map<String, IconData> _techIcons = {
    'building': Icons.apartment, // Building icon for general buildings
    'floorplan': Icons.view_comfy, // Floorplan icon for 2D plans
    '3dplan': Icons.transform, // 3D plan transformation icon
    'architecture': Icons.account_balance, // Architecture icon
    'interior': Icons.design_services, // Interior design icon
    'construction': Icons.build, // Construction icon for building-related tasks
    'house': Icons.house, // House icon for home-related designs
    'blueprint': Icons.map, // Blueprint icon for architectural planning
    'home_improvement': Icons.home_repair_service, // Landing improvement icon
    'layout': Icons.grid_on, // Layout icon for design arrangements
    'furniture': Icons.chair, // Furniture icon for interior design
    'drafting': Icons.create, // Drafting icon for creating plans
    'planning': Icons.schedule, // Planning icon for project planning
    'renovation': Icons.auto_awesome, // Renovation icon for home renovations
    'building_materials': Icons.architecture, // Materials icon for building
    'landscape': Icons.landscape, // Landscape icon for exterior design
    'engineering': Icons.engineering, // Engineering icon for structural designs
    'sustainability': Icons.nature_people, // Sustainability icon for green design
    'design': Icons.palette, // Design icon for general design work
    'project_management': Icons.track_changes, // Project management icon
    'team': Icons.group, // Teamwork icon for collaboration
    'contract': Icons.assignment, // Contract icon for legal agreements
    'inspection': Icons.visibility, // Inspection icon for checking work progress
    'permits': Icons.assignment_turned_in, // Permits icon for legal approval
    'site': Icons.location_on, // Site planning and location
    'materials': Icons.shopping_basket, // Materials procurement and supplies
    'construction_site': Icons.work, // Construction site icon for site work
    'planner': Icons.event_note, // Planning and scheduling icon
    'scaffolding': Icons.stairs, // Scaffolding for construction
    'budget': Icons.attach_money, // Budget and finance management
    'lighting': Icons.lightbulb, // Lighting design or fixtures
    'ventilation': Icons.air, // Ventilation systems and air flow
    'plumbing': Icons.water_damage, // Plumbing works
    'electrical': Icons.electric_meter, // Electrical system design
    'safety': Icons.security, // Safety measures and equipment
    'inspection_tools': Icons.settings, // Tools for inspections or maintenance
    'project_icon': Icons.business, // Project overview or management
    'contractor': Icons.business_center, // Contractor services
    'demolition': Icons.delete_forever, // Demolition or teardown services
  };

  // Method to get IconData for a technology slug
  static IconData getIcon(String slug) {
    return _techIcons[slug] ?? Icons.code; // Default to code icon if not found
  }

  // Method to get all icons as a list
  static List<IconData> getAllIcons() {
    return _techIcons.values.toList();
  }

  // Method to get specific icons from a list of slugs
  static List<IconData> getIconsFromSlugs(List<String> slugs) {
    return slugs.map((slug) => getIcon(slug)).toList();
  }
}
