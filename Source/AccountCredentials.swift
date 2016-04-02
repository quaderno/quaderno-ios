//
// AccountCredentials.swift
//
// Copyright (c) 2015-2016 Recrea (http://recreahq.com/)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.


/**
 The credentials of an account entitled to use the service.
 */
public struct AccountCredentials {

  /// The identity of a user.
  public let id: Int

  /// The name of a user.
  public let name: String

  /// The email of a user.
  public let email: String

  /// The base URL assigned to an account, for making requests to the service.
  public let baseURL: String

}


// MARK: - Initializing From a JSON Response

extension AccountCredentials {

  /**
   Initializes an instance with a JSON object.

   - precondition: All expected headers must be present. Otherwise
   initialization fails.

   - parameter jsonDictionary: A dictionary representing a JSON object,
   typically coming from a service response.

   - returns: A newly initialized instance.
   */
  init?(jsonDictionary: ResponseObject?) {
    guard let id = jsonDictionary?["id"] as? Int else {
      return nil
    }

    guard let name = jsonDictionary?["name"] as? String else {
      return nil
    }

    guard let email = jsonDictionary?["email"] as? String else {
      return nil
    }

    guard let baseURL = jsonDictionary?["href"] as? String else {
      return nil
    }

    self.id = id
    self.name = name
    self.email = email
    self.baseURL = baseURL
  }

}
