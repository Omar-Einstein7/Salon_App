import 'dart:async';
import 'package:flutter/material.dart';

class CallScreen extends StatefulWidget {
  final String name;
  final String avatar;

  const CallScreen({super.key, required this.name, required this.avatar});

  @override
  State<CallScreen> createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  late Timer _timer;
  int _seconds = 0;
  bool _isSpeakerOn = false;
  bool _isMuted = false;
  bool _isVideoOn = false;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {
          _seconds++;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  String get _durationString {
    final duration = Duration(seconds: _seconds);
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    if (duration.inHours > 0) {
      return '$hours:$minutes:$seconds';
    }
    return '$minutes:$seconds';
  }

  void _toggleSpeaker() {
    setState(() {
      _isSpeakerOn = !_isSpeakerOn;
    });
  }

  void _toggleMute() {
    setState(() {
      _isMuted = !_isMuted;
    });
  }

  void _toggleVideo() {
    setState(() {
      _isVideoOn = !_isVideoOn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(), // Spacer for top
              Column(
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(widget.avatar),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    widget.name,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    _seconds == 0 ? 'Calling...' : _durationString,
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildControlButton(
                    onPressed: _toggleMute,
                    icon: _isMuted ? Icons.mic_off : Icons.mic,
                    label: 'Mute',
                    isActive: _isMuted,
                  ),
                  _buildVideoButton(),
                  _buildControlButton(
                    onPressed: _toggleSpeaker,
                    icon: _isSpeakerOn ? Icons.volume_up : Icons.volume_down,
                    label: 'Speaker',
                    isActive: _isSpeakerOn,
                  ),
                  _buildEndCallButton(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildControlButton({
    required VoidCallback onPressed,
    required IconData icon,
    required String label,
    bool isActive = false,
  }) {
    return Column(
      children: [
        GestureDetector(
          onTap: onPressed,
          child: CircleAvatar(
            radius: 30,
            backgroundColor: isActive ? Colors.grey[300] : Colors.grey[100],
            child: Icon(
              icon,
              color: isActive ? Colors.orange : Colors.grey[600],
              size: 28,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(label, style: TextStyle(color: Colors.grey[600])),
      ],
    );
  }

  Widget _buildVideoButton() {
    return Column(
      children: [
        GestureDetector(
          onTap: _toggleVideo,
          child: CircleAvatar(
            radius: 30,
            backgroundColor: _isVideoOn ? Colors.grey[300] : Colors.grey[100],
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (child, animation) {
                return ScaleTransition(scale: animation, child: child);
              },
              child: Icon(
                _isVideoOn ? Icons.videocam : Icons.videocam_off,
                key: ValueKey<bool>(_isVideoOn),
                color: _isVideoOn ? Colors.orange : Colors.grey[600],
                size: 28,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text('Video', style: TextStyle(color: Colors.grey[600])),
      ],
    );
  }

  Widget _buildEndCallButton() {
    return Column(
      children: [
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const CircleAvatar(
            radius: 30,
            backgroundColor: Colors.red,
            child: Icon(Icons.call_end, color: Colors.white, size: 28),
          ),
        ),
        const SizedBox(height: 8),
        Text('End', style: TextStyle(color: Colors.grey[600])),
      ],
    );
  }
}
