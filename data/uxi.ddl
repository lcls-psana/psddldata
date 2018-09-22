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
  [[language("C++")]] @{ return _readOnlyPots & (1<<i); @}

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

//------------------ FrameV1 ------------------
@type FrameV1
  [[type_id(Id_UxiFrame, 1)]]
  [[pack(2)]]
  [[config(ConfigV1)]]
{
  uint32_t _acquisitionCount -> acquisitionCount; /* The internal acquisition counter number of the detector. */
  uint32_t _timestamp -> timestamp; /* The internal detector timestamp associated with the frames. */
  double   _temperature -> temperature; /* The temperature of the detector associated with the frames. */
  uint16_t _frames[@config.numberOfFrames()][@config.height()][@config.width()] -> frames;

  /* Constructor with values for scalar attributes */
  @init(acquisitionCount -> _acquisitionCount, timestamp -> _timestamp, temperature -> _temperature)  [[inline]];
}

} //- @package Uxi
