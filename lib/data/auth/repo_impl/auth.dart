import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:salon_app/data/auth/model/signin.dart';
import 'package:salon_app/data/auth/model/signup_req_params.dart';
import 'package:salon_app/data/auth/sources/auth_api_source.dart';
import 'package:salon_app/domain/auth/repo/auth.dart';
import 'package:salon_app/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepositoryImpl extends AuthRepository {
  static const String _accessTokenKey = 'access_token';
  static const String _refreshTokenKey = 'refresh_token';
  static const String _userKey = 'user';

  AuthRepositoryImpl();

  @override
  Future<Either> signup(
    SignupReqParams params,
  ) async {
    var result = await sl<AuthApiServiceImpl>().signup(params);
    return result.fold(
      (error) => Left(error),
      (response) async {
        try {
          if (response != null && response['data'] != null) {
            final data = response['data'];
            final accessToken = data['accessToken'];
            final refreshToken = data['refreshToken'];
            final user = data['user'];

            if (accessToken != null) {
              final SharedPreferences prefs = await SharedPreferences.getInstance();
              await Future.wait([
                prefs.setString(_accessTokenKey, accessToken),
                if (refreshToken != null) prefs.setString(_refreshTokenKey, refreshToken),
                if (user != null) prefs.setString(_userKey, json.encode(user)),
              ]);
              return Right(response);
            }
          }
          return Left('Invalid response format or missing access token');
        } catch (e) {
          return Left('Error saving auth data: $e');
        }
      }
    );
  }

  @override
  Future<Either> signin(SigninReqParams params) async {
    var result = await sl<AuthService>().signin(params);
    return result.fold(
      (error) => Left(error),
      (response) async {
        try {
          if (response != null && response['data'] != null) {
            final data = response['data'];
            final accessToken = data['accessToken'];
            final refreshToken = data['refreshToken'];
            final user = data['user'];

            if (accessToken != null) {
              final SharedPreferences prefs = await SharedPreferences.getInstance();
              await Future.wait([
                prefs.setString(_accessTokenKey, accessToken),
                if (refreshToken != null) prefs.setString(_refreshTokenKey, refreshToken),
                if (user != null) prefs.setString(_userKey, json.encode(user)),
              ]);
              return Right(response);
            }
          }
          return Left('Invalid response format or missing access token');
        } catch (e) {
          return Left('Error saving auth data: $e');
        }
      }
    );
  }

  @override
  Future<bool> isLoggedIn() async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var accessToken = sharedPreferences.getString(_accessTokenKey);
    var refreshToken = sharedPreferences.getString(_refreshTokenKey);
    
    if (accessToken == null || refreshToken == null) {
      return false;
    } else {
      return true;
    }
  }

  @override
  Future<Either<String, bool>> logout() async {
    try {
      // First call the logout API
      final result = await sl<AuthApiServiceImpl>().logout();
      
      // Whether API call succeeds or fails, clear local data
      final prefs = await SharedPreferences.getInstance();
      await Future.wait([
        prefs.remove(_accessTokenKey),
        prefs.remove(_refreshTokenKey),
        prefs.remove(_userKey),
      ]);

      return result.fold(
        (failure) {
          // Even if API fails, we've cleared local data, so consider it a "soft" success
          return Right(true);
        },
        (success) => Right(true)
      );
    } catch (e) {
      // On any error, still try to clear local data
      try {
        final prefs = await SharedPreferences.getInstance();
        await Future.wait([
          prefs.remove(_accessTokenKey),
          prefs.remove(_refreshTokenKey),
          prefs.remove(_userKey),
        ]);
        return Right(true);
      } catch (e) {
        return Left('Failed to clear local data during logout');
      }
    }
  }

  Future<void> _saveAuthData(Map<String, dynamic> response) async {
    final data = response['data'] as Map<String, dynamic>;
    final accessToken = data['accessToken'] as String;
    final refreshToken = data['user']['refreshToken'] as String;
    final user = data['user'] as Map<String, dynamic>;

    await Future.wait([
      sl<SharedPreferences>().setString(_accessTokenKey, accessToken),
      sl<SharedPreferences>().setString(_refreshTokenKey, refreshToken),
      sl<SharedPreferences>().setString(_userKey, json.encode(user)),
    ]);
  }
}
