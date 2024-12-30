import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioPlayerScreen extends StatefulWidget {
  @override
  _AudioPlayerScreenState createState() => _AudioPlayerScreenState();
}

class _AudioPlayerScreenState extends State<AudioPlayerScreen> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isPlaying = false;
  bool _isPaused = false;
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;
  
  // Audio duration and position listener
  @override
  void initState() {
    super.initState();
    
    // Listen for changes in audio duration and position
    _audioPlayer.onDurationChanged.listen((d) {
      setState(() {
        _duration = d;
      });
    });
    _audioPlayer.onPositionChanged.listen((p) {
      setState(() {
        _position = p;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _audioPlayer.dispose();
  }

  // Play/pause control
  void _togglePlayPause() async {
    if (_isPlaying) {
      await _audioPlayer.pause();
      setState(() {
        _isPlaying = false;
        _isPaused = true;
      });
    } else {
      await _audioPlayer.play(AssetSource('audio/sample1.mp3'));
      setState(() {
        _isPlaying = true;
        _isPaused = false;
      });
    }
  }

  // Stop audio
  void _stopAudio() async {
    await _audioPlayer.stop();
    setState(() {
      _isPlaying = false;
      _isPaused = false;
      _position = Duration.zero;
    });
  }

  // Seek to position
  void _seekTo(double value) {
    final position = Duration(seconds: value.toInt());
    _audioPlayer.seek(position);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Audio Player')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Audio Controls",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blueAccent),
            ),
            SizedBox(height: 20),

            // Play/Pause Button
            ElevatedButton(
              onPressed: _togglePlayPause,
              child: Text(
                _isPlaying ? "Pause Audio" : "Play Audio",
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(height: 15),

            // Stop Button
            ElevatedButton(
              onPressed: _stopAudio,
              child: Text(
                "Stop Audio",
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(height: 20),

            // Progress Bar
            Slider(
              value: _position.inSeconds.toDouble(),
              min: 0.0,
              max: _duration.inSeconds.toDouble(),
              onChanged: _seekTo,
              activeColor: Colors.blueAccent,
              inactiveColor: Colors.grey,
            ),
            SizedBox(height: 10),
            Text(
              "${_position.toString().split('.').first} / ${_duration.toString().split('.').first}",
              style: TextStyle(fontSize: 16),
            ),

            // Visual State Indicator
            if (_isPlaying) ...[
              SizedBox(height: 20),
              Icon(Icons.play_arrow, color: Colors.green, size: 50), // Play sign
            ] else if (_isPaused) ...[
              SizedBox(height: 20),
              Icon(Icons.pause, color: Colors.orange, size: 50), // Pause sign
            ]
          ],
        ),
      ),
    );
  }
}
