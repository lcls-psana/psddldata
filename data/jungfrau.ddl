@package Jungfrau {

//------------------ ConfigV1 ------------------
@type ConfigV1
  [[type_id(Id_JungfrauConfig, 1)]]
  [[config_type]]
  [[pack(4)]]
{
  @enum GainMode (uint16_t) {
    Normal      = 0,
    FixedGain1  = 1,
    FixedGain2  = 2,
    ForcedGain1 = 3,
    ForcedGain2 = 4,
    HighGain0   = 5,
  }

  @enum SpeedMode (uint16_t) {
    Quarter = 0,
    Half    = 1,
  }

  uint32_t  _numberOfModules -> numberOfModules; /* The number of modules in a physical camera. */
  uint32_t  _numberOfRowsPerModule -> numberOfRowsPerModule; /* The number of rows per module. */
  uint32_t  _numberOfColumnsPerModule -> numberOfColumnsPerModule; /* The number of columns per module. */
  uint32_t  _biasVoltage -> biasVoltage; /* The bias applied to the sensor in volts. */
  GainMode  _gainMode -> gainMode; /* The gain mode set for the camera. */
  SpeedMode _speedMode -> speedMode; /* The camera clock speed setting. */
  double    _triggerDelay -> triggerDelay; /* Internal delay from receiving a trigger input until the start of an acquisiton in seconds. */
  double    _exposureTime -> exposureTime; /* The exposure time in seconds. */

  /* Total size in bytes of the Frame object */
  uint32_t frameSize()
  [[language("C++")]] @{ return 12 + @self.numPixels()*2; @}

  /* calculate total frame size in pixels based on the current ROI and binning settings */
  uint32_t numPixels()  [[inline]]
  [[language("C++")]] @{ return numberOfModules()*numberOfRowsPerModule()*numberOfColumnsPerModule(); @}
  
  /* Constructor which takes values for every attribute */
  @init()  [[auto]];
}

//------------------ ConfigV2 ------------------
@type ConfigV2
  [[type_id(Id_JungfrauConfig, 2)]]
  [[config_type]]
  [[pack(4)]]
{
  @enum GainMode (uint16_t) {
    Normal      = 0,
    FixedGain1  = 1,
    FixedGain2  = 2,
    ForcedGain1 = 3,
    ForcedGain2 = 4,
    HighGain0   = 5,
  }

  @enum SpeedMode (uint16_t) {
    Quarter = 0,
    Half    = 1,
  }

  uint32_t  _numberOfModules -> numberOfModules; /* The number of modules in a physical camera. */
  uint32_t  _numberOfRowsPerModule -> numberOfRowsPerModule; /* The number of rows per module. */
  uint32_t  _numberOfColumnsPerModule -> numberOfColumnsPerModule; /* The number of columns per module. */
  uint32_t  _biasVoltage -> biasVoltage; /* The bias applied to the sensor in volts. */
  GainMode  _gainMode -> gainMode; /* The gain mode set for the camera. */
  SpeedMode _speedMode -> speedMode; /* The camera clock speed setting. */
  double    _triggerDelay -> triggerDelay; /* Internal delay from receiving a trigger input until the start of an acquisiton in seconds. */
  double    _exposureTime -> exposureTime; /* The exposure time in seconds. */
  double    _exposurePeriod -> exposurePeriod; /* The period between exposures of the camera. In triggered mode this should be smaller than the trigger period. */
  uint16_t  _vb_ds -> vb_ds;            /* Value of vb_ds in bits. 12bit on 0 to 2.5V (i.e. 2.5V = 4096). */
  uint16_t  _vb_comp -> vb_comp;        /* Value of vb_comp in bits. 12bit on 0 to 2.5V (i.e. 2.5V = 4096). */
  uint16_t  _vb_pixbuf -> vb_pixbuf;    /* Value of vb_pixbuf in bits. 12bit on 0 to 2.5V (i.e. 2.5V = 4096). */
  uint16_t  _vref_ds -> vref_ds;        /* Value of vref_ds in bits. 12bit on 0 to 2.5V (i.e. 2.5V = 4096). */
  uint16_t  _vref_comp -> vref_comp;    /* Value of vref_comp in bits. 12bit on 0 to 2.5V (i.e. 2.5V = 4096). */
  uint16_t  _vref_prech -> vref_prech;  /* Value of vref_prech in bits. 12bit on 0 to 2.5V (i.e. 2.5V = 4096). */
  uint16_t  _vin_com -> vin_com;        /* Value of vin_com in bits. 12bit on 0 to 2.5V (i.e. 2.5V = 4096). */
  uint16_t  _vdd_prot -> vdd_prot;      /* Value of vdd_prot in bits. 12bit on 0 to 2.5V (i.e. 2.5V = 4096). */

  /* Total size in bytes of the Frame object */
  uint32_t frameSize()
  [[language("C++")]] @{ return 12 + @self.numPixels()*2; @}

  /* calculate total frame size in pixels based on the current ROI and binning settings */
  uint32_t numPixels()  [[inline]]
  [[language("C++")]] @{ return numberOfModules()*numberOfRowsPerModule()*numberOfColumnsPerModule(); @}

  /* Constructor which takes values for every attribute */
  @init()  [[auto]];
}

//------------------ ElementV1 ------------------
@type ElementV1
  [[type_id(Id_JungfrauElement, 1)]]
  [[pack(2)]]
  [[config(ConfigV1, ConfigV2)]]
{
  uint32_t _frameNumber -> frameNumber; /* The internal frame counter number of the detector. */
  uint32_t _ticks -> ticks; /* The LCLS timing tick associated with the detector frame. */
  uint32_t _fiducials -> fiducials; /* The LCLS timing fiducial associated with the detector frame. */
  uint16_t _frame[@config.numberOfModules()][@config.numberOfRowsPerModule()][@config.numberOfColumnsPerModule()] -> frame;
}

} //- @package Jungfrau
