import 'package:flutter/widgets.dart';

class FocusNeighbors {
  final String? up;
  final String? down;
  final String? left;
  final String? right;

  const FocusNeighbors({
    this.up,
    this.down,
    this.left,
    this.right,
  });

  String? forDirection(TraversalDirection direction) {
    switch (direction) {
      case TraversalDirection.up:
        return up;
      case TraversalDirection.down:
        return down;
      case TraversalDirection.left:
        return left;
      case TraversalDirection.right:
        return right;
    }
  }
}

class FocusNavigationController {
  final Map<String, FocusNode> _nodesById = {};
  final Map<FocusNode, String> _idsByNode = {};
  final Map<String, FocusNeighbors> _neighborsById = {};

  void registerNode(
    String id,
    FocusNode node, {
    FocusNeighbors? neighbors,
  }) {
    _nodesById[id] = node;
    _idsByNode[node] = id;
    if (neighbors != null) {
      _neighborsById[id] = neighbors;
    }
  }

  void unregisterNode(String id) {
    final node = _nodesById.remove(id);
    if (node != null) {
      _idsByNode.remove(node);
    }
    _neighborsById.remove(id);
  }

  void updateNeighbors(String id, FocusNeighbors neighbors) {
    _neighborsById[id] = neighbors;
  }

  FocusNode? nodeById(String id) => _nodesById[id];

  String? idByNode(FocusNode node) => _idsByNode[node];

  FocusNode? neighborOf(FocusNode node, TraversalDirection direction) {
    final id = _idsByNode[node];
    if (id == null) return null;

    final neighbors = _neighborsById[id];
    if (neighbors == null) return null;

    final neighborId = neighbors.forDirection(direction);
    if (neighborId == null) return null;

    return _nodesById[neighborId];
  }
}
