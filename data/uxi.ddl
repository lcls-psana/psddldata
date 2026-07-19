@package Uxi {

//------------------ ConfigV1 ------------------
@type ConfigV1
  [[type_id(Id_UxiConfig, 1)]]
  [[config_type]]
  [[pack(4)]]
{
  /* Defines the number of potentiometers in the Icarus detector. */
  @const uint32_t NumberOfPots = 13;
  @const uint32_t NumberOfSides = 2;

  uint32_t  _width -> width; /* The width in pixels of each frame of the detector. */
  uint32_t  _height -> height; /* The height in pixels of each frame of the detector. */
  uint32_t  _numberOfFrames -> numberOfFrames; /* The number of frames produced by the detector. */
  uint32_t  _numberOfBytesPerPixel -> numberOFBytesPerPixel; /* The number of bytes for each pixel. */
  uint32_t  _sensorType -> sensorType; /* The sensor type ID. */
  uint32_t  _timeOn[NumberOfSides] -> timeOn; /* High speed timing on parameter in ns for each side. */
  uint32_t  _timeOff[NumberOfSides] -> timeOff; /* High speed timing off parameter in ns for each side. */
  uint32_t  _delay[NumberOfSides] -> delay; /* High speed timing initial delay in ns for each side. */
  uint32_t  _readOnlyPots -> readOnlyPots; /* Bitmask to designate which pots should only be read and not written. */
  double    _pots[NumberOfPots] -> pots; /* The values of the each of the pots in volts. */

  /* Check if a pot is readonly. */
  uint8_t potIsReadOnly(uint8_t i)  [[inline]]
  [[language("C++")]] @{ return ((i<NumberOfPots) && (_readOnlyPots & (1<<i))) ? 1 : 0; @}

  /* Check if a pot was tuned. */
  uint8_t potIsTuned(uint8_t i) [[inline]]
  [[language("C++")]] @{ return ((i<NumberOfPots) && (_readOnlyPots & (1<<(i+NumberOfPots)))) ? 1 : 0; @}

  /* calculate total number of pixels per frame. */
  uint32_t numPixelsPerFrame()  [[inline]]
  [[language("C++")]] @{ return @self.width()*@self.height(); @}

  /* calculate total number of pixels across all frames. */
  uint32_t numPixels()  [[inline]]
  [[language("C++")]] @{ return @self.width()*@self.height()*@self.numberOfFrames(); @}

  /* Total size in bytes of the frame */
  uint32_t frameSize()
  [[language("C++")]] @{ return @self.numPixels()*@self.numberOFBytesPerPixel(); @}

  /* Constructor which takes values for every attribute */
  @init()  [[auto]];
}

//------------------ RoiCoord ------------------
@type RoiCoord
  [[value_type]]
{
  uint16_t _first -> first; /* The first row/frame of ROI. */
  uint16_t _last -> last;   /* The last row/frame of ROI. */

  /* Constructor which takes values for every attribute */
  @init()  [[auto, inline]];
}

//------------------ ConfigV2 ------------------
@type ConfigV2
  [[type_id(Id_UxiConfig, 2)]]
  [[config_type]]
  [[pack(4)]]
{
  /* Defines the number of potentiometers in the Icarus detector. */
  @const uint32_t NumberOfPots = 13;
  @const uint32_t NumberOfSides = 2;

  @enum RoiMode (uint32_t) {
    Off = 0,
    On  = 1,
  }

  RoiMode   _roiEnable -> roiEnable; /* Enable frame/row roi. */
  RoiCoord  _roiRows -> roiRows; /* The first/last rows of the roi. */
  RoiCoord  _roiFrames -> roiFrames; /* The first/last frames of the roi. */
  uint32_t  _width -> width; /* The width in pixels of each frame of the detector. */
  uint32_t  _height -> height; /* The height in pixels of each frame of the detector. */
  uint32_t  _numberOfFrames -> numberOfFrames; /* The number of frames produced by the detector. */
  uint32_t  _numberOfBytesPerPixel -> numberOFBytesPerPixel; /* The number of bytes for each pixel. */
  uint32_t  _sensorType -> sensorType; /* The sensor type ID. */
  uint32_t  _timeOn[NumberOfSides] -> timeOn; /* High speed timing on parameter in ns for each side. */
  uint32_t  _timeOff[NumberOfSides] -> timeOff; /* High speed timing off parameter in ns for each side. */
  uint32_t  _delay[NumberOfSides] -> delay; /* High speed timing initial delay in ns for each side. */
  uint32_t  _readOnlyPots -> readOnlyPots; /* Bitmask to designate which pots should only be read and not written. */
  double    _pots[NumberOfPots] -> pots; /* The values of the each of the pots in volts. */

  /* Check if a pot is readonly. */
  uint8_t potIsReadOnly(uint8_t i)  [[inline]]
  [[language("C++")]] @{ return ((i<NumberOfPots) && (_readOnlyPots & (1<<i))) ? 1 : 0; @}

  /* Check if a pot was tuned. */
  uint8_t potIsTuned(uint8_t i) [[inline]]
  [[language("C++")]] @{ return ((i<NumberOfPots) && (_readOnlyPots & (1<<(i+NumberOfPots)))) ? 1 : 0; @}

  /* calculate total number of pixels per frame. */
  uint32_t numPixelsPerFrame()  [[inline]]
  [[language("C++")]] @{ return @self.width()*@self.height(); @}

  /* calculate total number of pixels across all frames. */
  uint32_t numPixels()  [[inline]]
  [[language("C++")]] @{ return @self.width()*@self.height()*@self.numberOfFrames(); @}

  /* Total size in bytes of the frame */
  uint32_t frameSize()
  [[language("C++")]] @{ return @self.numPixels()*@self.numberOFBytesPerPixel(); @}

  /* Constructor which takes values for every attribute */
  @init()  [[auto]];
}

//------------------ ConfigV3 ------------------
@type ConfigV3
  [[type_id(Id_UxiConfig, 3)]]
  [[config_type]]
  [[pack(4)]]
{
  /* Defines the number of potentiometers in the Icarus detector. */
  @const uint32_t NumberOfPots = 13;
  @const uint32_t NumberOfSides = 2;

  @enum RoiMode (uint32_t) {
    Off = 0,
    On  = 1,
  }

  @enum OscMode (uint32_t) {
    RelaxationOsc   = 0,
    RingOscWithCaps = 1,
    RingOscNoCaps   = 2,
    ExternalClock   = 3,
  }

  RoiMode   _roiEnable -> roiEnable; /* Enable frame/row roi. */
  RoiCoord  _roiRows -> roiRows; /* The first/last rows of the roi. */
  RoiCoord  _roiFrames -> roiFrames; /* The first/last frames of the roi. */
  OscMode   _oscillator -> oscillator; /* The oscillator to that the detector should use. */
  uint32_t  _width -> width; /* The width in pixels of each frame of the detector. */
  uint32_t  _height -> height; /* The height in pixels of each frame of the detector. */
  uint32_t  _numberOfFrames -> numberOfFrames; /* The number of frames produced by the detector. */
  uint32_t  _numberOfBytesPerPixel -> numberOFBytesPerPixel; /* The number of bytes for each pixel. */
  uint32_t  _sensorType -> sensorType; /* The sensor type ID. */
  uint32_t  _timeOn[NumberOfSides] -> timeOn; /* High speed timing on parameter in ns for each side. */
  uint32_t  _timeOff[NumberOfSides] -> timeOff; /* High speed timing off parameter in ns for each side. */
  uint32_t  _delay[NumberOfSides] -> delay; /* High speed timing initial delay in ns for each side. */
  uint32_t  _readOnlyPots -> readOnlyPots; /* Bitmask to designate which pots should only be read and not written. */
  double    _pots[NumberOfPots] -> pots; /* The values of the each of the pots in volts. */

  /* Check if a pot is readonly. */
  uint8_t potIsReadOnly(uint8_t i)  [[inline]]
  [[language("C++")]] @{ return ((i<NumberOfPots) && (_readOnlyPots & (1<<i))) ? 1 : 0; @}

  /* Check if a pot was tuned. */
  uint8_t potIsTuned(uint8_t i) [[inline]]
  [[language("C++")]] @{ return ((i<NumberOfPots) && (_readOnlyPots & (1<<(i+NumberOfPots)))) ? 1 : 0; @}

  /* calculate total number of pixels per frame. */
  uint32_t numPixelsPerFrame()  [[inline]]
  [[language("C++")]] @{ return @self.width()*@self.height(); @}

  /* calculate total number of pixels across all frames. */
  uint32_t numPixels()  [[inline]]
  [[language("C++")]] @{ return @self.width()*@self.height()*@self.numberOfFrames(); @}

  /* Total size in bytes of the frame */
  uint32_t frameSize()
  [[language("C++")]] @{ return @self.numPixels()*@self.numberOFBytesPerPixel(); @}

  /* Constructor which takes values for every attribute */
  @init()  [[auto]];
}

//------------------ Register ------------------
@type Register
  [[value_type]]
{
  /* Length of the name array. */
  @const int32_t NameSize = 128;

  char _name[NameSize] -> name  [[shape_method(None)]]; /* Name of the register. */
  uint32_t _value -> value; /* Value for the register. */

  /* Constructor which takes values for every attribute */
  @init()  [[auto, inline]];
}

//------------------ ConfigV4 ------------------
@type ConfigV4
  [[type_id(Id_UxiConfig, 4)]]
  [[config_type]]
  [[pack(4)]]
{
  /* Defines the maximum length for a timing sequence. */
  @const uint32_t MaxTimingSequence = 40;
  /* Defines the maximum length for a manual shutter sequence. */
  @const uint32_t MaxManualShutterSequence = 7;
  /* Defines the number of potentiometers in the Icarus detector. */
  @const uint32_t NumberOfPots = 13;
  @const uint32_t NumberOfSides = 2;

  @enum RoiMode (uint32_t) {
    Off = 0,
    On  = 1,
  }

  @enum OscMode (uint32_t) {
    RelaxationOsc   = 0,
    RingOscWithCaps = 1,
    RingOscNoCaps   = 2,
    ExternalClock   = 3,
  }

  @enum TimingMode (uint32_t) {
    BasicTiming     = 0,
    ArbitraryTiming = 1,
    ManualTiming    = 2,
  }

  @enum BasicTimingIdx (uint32_t) {
    Open   = 0,
    Closed = 1,
    Delay  = 2,
  }

  RoiMode    _roiEnable -> roiEnable; /* Enable frame/row roi. */
  RoiCoord   _roiRows -> roiRows; /* The first/last rows of the roi. */
  RoiCoord   _roiFrames -> roiFrames; /* The first/last frames of the roi. */
  OscMode    _oscillator -> oscillator; /* The oscillator to that the detector should use. */
  uint32_t   _width -> width; /* The width in pixels of each frame of the detector. */
  uint32_t   _height -> height; /* The height in pixels of each frame of the detector. */
  uint32_t   _numberOfFrames -> numberOfFrames; /* The number of frames produced by the detector. */
  uint32_t   _numberOfBytesPerPixel -> numberOFBytesPerPixel; /* The number of bytes for each pixel. */
  uint32_t   _sensorType -> sensorType; /* The sensor type ID. */
  TimingMode _timingMode -> timingMode; /* Determines how the timing sequence should be interpreted. */
  /* Raw timing sequence as array of uint32_t, method is generally for internal use only, use timing() for access to the timing data */
  uint32_t   _timingSequence[NumberOfSides][MaxTimingSequence] -> timingSequence;
  uint32_t   _readOnlyPots -> readOnlyPots; /* Bitmask to designate which pots should only be read and not written. */
  double     _pots[NumberOfPots] -> pots; /* The values of the each of the pots in volts. */
  uint32_t   _numberOfRegisters -> numberOfRegisters; /* Number of Register objects in this configuration. */
  Register   _registers[@self.numberOfRegisters()] -> registers [[shape_method(registers_shape)]]; /* Register configuration objects */

  /* Check if a pot is readonly. */
  uint8_t potIsReadOnly(uint8_t i)  [[inline]]
  [[language("C++")]] @{ return ((i<NumberOfPots) && (_readOnlyPots & (1<<i))) ? 1 : 0; @}

  /* Check if a pot was tuned. */
  uint8_t potIsTuned(uint8_t i) [[inline]]
  [[language("C++")]] @{ return ((i<NumberOfPots) && (_readOnlyPots & (1<<(i+NumberOfPots)))) ? 1 : 0; @}

  /* calculate total number of pixels per frame. */
  uint32_t numPixelsPerFrame()  [[inline]]
  [[language("C++")]] @{ return @self.width()*@self.height(); @}

  /* calculate total number of pixels across all frames. */
  uint32_t numPixels()  [[inline]]
  [[language("C++")]] @{ return @self.width()*@self.height()*@self.numberOfFrames(); @}

  /* Total size in bytes of the frame */
  uint32_t frameSize()
  [[language("C++")]] @{ return @self.numPixels()*@self.numberOFBytesPerPixel(); @}

  /* Helper function for getting timing in v3 and earlier format. */
  uint32_t[] timeArray(uint32_t idx)
  [[language("C++")]] @{
    ndarray<uint32_t,1> timeArray = make_ndarray<uint32_t>(NumberOfSides);
    if (@self.timingMode() == BasicTiming) {
      for (uint32_t side=0; side<NumberOfSides; side++) {
        timeArray[side] = @self.timingSequence()(side, idx);
      }
    } else {
      for (uint32_t* it=timeArray.begin(); it!=timeArray.end(); it++) {
        *it = 0;
      }
    }
    return timeArray;
  @}

  /* High speed timing on parameter in ns for each side. Backwards compat helper to v3 and earlier. */
  uint32_t[] timeOn()
  [[language("C++")]] @{
    return @self.timeArray(Open);
  @}

  /* High speed timing off parameter in ns for each side. Backwards compat helper to v3 and earlier. */
  uint32_t[] timeOff()
  [[language("C++")]] @{
    return @self.timeArray(Closed);
  @}

  /* High speed timing initial delay in ns for each side. Backwards compat helper to v3 and earlier. */
  uint32_t[] delay()
  [[language("C++")]] @{
    return @self.timeArray(Delay);
  @}

  /* Function that returns the valid length of the timingSequence based on the timing method */
  uint32_t timingLength()
  [[language("C++")]] @{
    uint32_t size = 0;
    switch (@self.timingMode()) {
    case  BasicTiming:
      size = 3;
      break;
    case ArbitraryTiming:
      size = MaxTimingSequence;
      break;
    case ManualTiming:
      size = MaxManualShutterSequence;
      break;
    }
    return size;
  @}

  /* Function that parses the timingSequence properly based on the timing method */
  uint32_t[] timing(uint32_t side)
  [[language("C++")]] @{
    uint32_t size = @self.timingLength();
    if (size > 0) {
      return make_ndarray(@self.timingSequence().data() + side * MaxTimingSequence, size);
    } else {
      return ndarray<const uint32_t, 1>();
    }
  @}

  /* Function that parses the timingSequence properly based on the timing method - 2D versio of timing function */
  uint32_t[][] timingArray()
  [[language("C++")]] @{
    uint32_t size = @self.timingLength();
    if (size > 0) {
      ndarray<uint32_t, 2> array = make_ndarray<uint32_t>(NumberOfSides, size);
      for (uint32_t side=0; side<NumberOfSides; side++) {
        const uint32_t* src = @self.timingSequence().data() + (side * MaxTimingSequence);
        uint32_t* dest = array.data() + (side * size);
        std::copy(src, src + (size), dest);
      }
      return array;
    } else {
      return ndarray<const uint32_t, 2>();
    }
  @}

  /* Constructor which takes values for every attribute */
  @init()  [[auto]];

  /* Constructor which takes values necessary for size calculations */
  @init(numberOfRegisters -> _numberOfRegisters) [[inline]];
}


//------------------ FrameV1 ------------------
@type FrameV1
  [[type_id(Id_UxiFrame, 1)]]
  [[pack(2)]]
  [[config(ConfigV1, ConfigV2, ConfigV3, ConfigV4)]]
{
  uint32_t _acquisitionCount -> acquisitionCount; /* The internal acquisition counter number of the detector. */
  uint32_t _timestamp -> timestamp; /* The internal detector timestamp associated with the frames. */
  double   _temperature -> temperature; /* The temperature of the detector associated with the frames. */
  uint16_t _frames[@config.numberOfFrames()][@config.height()][@config.width()] -> frames;

  /* Constructor with values for scalar attributes */
  @init(acquisitionCount -> _acquisitionCount, timestamp -> _timestamp, temperature -> _temperature)  [[inline]];
}

} //- @package Uxi
