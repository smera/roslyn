﻿// Copyright (c) Microsoft.  All Rights Reserved.  Licensed under the Apache License, Version 2.0.  See License.txt in the project root for license information.

#nullable enable

using System;
using System.Collections.Generic;
using System.Collections.Immutable;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;
using Microsoft.CodeAnalysis;

namespace Roslyn.Utilities
{
    internal static class ImmutableArrayExtensions
    {
        [StructLayout(LayoutKind.Sequential)]
        private struct ImmutableArrayProxy<T>
        {
            internal T[]? MutableArray;
        }

        internal static ImmutableArray<T> DangerousCreateFromUnderlyingArray<T>(ref T[]? array)
        {
            var proxy = new ImmutableArrayProxy<T> { MutableArray = array };
            array = null;
            return Unsafe.As<ImmutableArrayProxy<T>, ImmutableArray<T>>(ref proxy);
        }

        internal static bool Contains<T>(this ImmutableArray<T> items, T item, IEqualityComparer<T>? equalityComparer)
            => items.IndexOf(item, 0, equalityComparer) >= 0;

        internal static ImmutableArray<T> ToImmutableArrayOrEmpty<T>(this T[]? items)
        {
            if (items == null)
            {
                return ImmutableArray.Create<T>();
            }

            return ImmutableArray.Create<T>(items);
        }

        internal static ImmutableArray<T> ToImmutableArrayOrEmpty<T>(this IEnumerable<T>? items)
        {
            if (items == null)
            {
                return ImmutableArray.Create<T>();
            }

            if (items is ImmutableArray<T> array)
            {
                return array.NullToEmpty();
            }

            return ImmutableArray.CreateRange<T>(items);
        }

        internal static ImmutableArray<T> ToImmutableArrayOrEmpty<T>(this ImmutableArray<T> items)
            => items.IsDefault ? ImmutableArray<T>.Empty : items;

        internal static IReadOnlyList<T> ToImmutableReadOnlyListOrEmpty<T>(this IEnumerable<T>? items)
        {
            if (items is ImmutableArray<T> array && !array.IsDefault)
            {
                return (IReadOnlyList<T>)items;
            }
            else
            {
                return items.ToImmutableArrayOrEmpty();
            }
        }
    }
}
