# TallyCounter
A minimalistic tally counter that allow users to count by pressing headset's play/stop button. Besides, users may set sound and vibration as clues for key-pressing.

There are some known limitations that cannot be nicely solved:
* For a very quick-and-consecutive key pressing, the times of vibration may be much less than the actual key pressing users did.
* Under previous condition, counting via play/stop button of a headset may issue less sound/vibration clues. It's because the app intercepts "next track"(2 consecutive key pressing) and "previous track"(3 consecutive key pressing) to allow counting with quick-and-consecutive counting while using a headset.
* When couting via headset's play/stop button, use a headset whose play/stop button is easy to press. That allows precise triggering of click events (toggle/next track/previous track).
* If users open an app that may occupy system's control center, such as a music or video player, re-open Tally Counter is required to keep headset button couting work as expected. Tally Counter needs to occupy control center to intercept remote control events.
