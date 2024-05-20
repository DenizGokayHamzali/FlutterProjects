class SmartDevices {
  String? deviceName;
  String? iconPath;
  bool? powerStatus;


  SmartDevices({ // {} for required.
    required this.deviceName,
    required this.iconPath,
    this.powerStatus = false,
  });

  static List<SmartDevices> mySmartDevices() {
    return [
      SmartDevices(
        deviceName: 'Smart Light',
        iconPath: 'lib/icons/light-bulb.png',
        powerStatus: true,
      ),
      SmartDevices(
          deviceName: 'Smart AC',
          iconPath: 'lib/icons/air-conditioner.png',
          powerStatus: true,
      ),
      SmartDevices(
          deviceName: 'Smart TV',
          iconPath: 'lib/icons/smart-tv.png',
          powerStatus: false,
      ),
      SmartDevices(
          deviceName: 'Fan',
          iconPath: 'lib/icons/fan.png',
      ),
    ];
  }
}