// Direction+Comparison.Protocol.swift
// Conformance of Direction to Comparison.Protocol — unconditional.
//
// `Comparison.Protocol` aliases `Swift.Comparable`; the comparison witness lives
// in the root (Direction.swift).

public import Comparison_Primitives
public import Direction_Primitive

extension Direction: Comparison.`Protocol` {}
